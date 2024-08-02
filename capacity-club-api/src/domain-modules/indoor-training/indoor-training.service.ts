import { CrudService } from './../shared/model/interface/crud-service.interface';
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { WorkoutService } from 'domain-modules/workout/workout.service';
import { IndoorTrainingSubscriptionService } from 'domain-modules/indoor-training-subscription/indoor-training-subscription.service';
import { UniqueId } from '@common/model';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { isNil } from 'lodash';
import { Repository, Brackets } from 'typeorm';
import {
  IndoorTrainingListException,
  IndoorTrainingNotFoundException,
  IndoorTrainingCreateException,
  IndoorTrainingUpdateException,
  IndoorTrainingDeleteException,
} from './indoor-training.exception';
import { IndoorTraining } from './model/entity/indoor-training.entity';
import { IndoorTrainingFilter } from './model/filter/indoor-training.filter';
import { IndoorTrainingCreatePayload } from './model/payload/indoor-training-create.payload';
import { IndoorTrainingUpdatePayload } from './model/payload/indoor-training-update.payload';

/**
 * Service for managing indoor training sessions.
 * Implements CRUD operations and filtering for IndoorTraining entities.
 */
@Injectable()
export class IndoorTrainingService
  implements
    CrudService<
      IndoorTraining,
      IndoorTrainingCreatePayload,
      IndoorTrainingUpdatePayload,
      IndoorTrainingFilter,
      string
    >
{
  constructor(
    @InjectRepository(IndoorTraining)
    private readonly repository: Repository<IndoorTraining>,
    @Inject(forwardRef(() => WorkoutService))
    private readonly workout_service: WorkoutService,
    @Inject(forwardRef(() => IndoorTrainingSubscriptionService))
    private readonly indoor_training_subscription_service: IndoorTrainingSubscriptionService,
  ) {}

  /**
   * Retrieves all indoor training sessions.
   * @returns A list of all IndoorTraining entries.
   * @throws IndoorTrainingListException if retrieval fails.
   */
  async getAll(): Promise<IndoorTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new IndoorTrainingListException();
    }
  }

  /**
   * Filters indoor training sessions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of IndoorTraining entries matching the criteria.
   */
  async filter(filter: IndoorTrainingFilter): Promise<IndoorTraining[]> {
    const queryBuilder = this.repository.createQueryBuilder('indoor-training');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        console.log(`Key: ${key}, Value: ${value}, Type: ${typeof value}`);

        switch (key) {
          case 'is_collective':
            queryBuilder.andWhere(`"indoor-training"."${key}" = :${key}`, {
              [key]: value,
            });
            break;
          case 'training_date':
            const date = new Date(value);
            const year: number = date.getUTCFullYear();
            const month: number = date.getUTCMonth() + 1;
            const day: number = date.getUTCDate();

            queryBuilder.andWhere(
              new Brackets((qb) => {
                qb.where(
                  `CAST(EXTRACT(YEAR FROM "indoor-training"."training_date") AS int) = :year`,
                  { year },
                )
                  .andWhere(
                    `CAST(EXTRACT(MONTH FROM "indoor-training"."training_date") AS int) = :month`,
                    { month },
                  )
                  .andWhere(
                    `CAST(EXTRACT(DAY FROM "indoor-training"."training_date") AS int) = :day`,
                    { day },
                  );
              }),
            );
            break;
          case 'start_hours':
          case 'end_hours':
            queryBuilder.andWhere(`"indoor-training"."${key}" = :${key}`, {
              [key]: value,
            });
            break;
          case 'nb_place':
          case 'nb_subscription':
            queryBuilder.andWhere(`"indoor-training"."${key}" = :${key}`, {
              [key]: parseInt(value, 10),
            });
            break;
          case 'workout':
            queryBuilder.andWhere(`"indoor-training"."${key}" = :${key}`, {
              [key]: value, // to check after
            });
            break;
          default:
            queryBuilder.andWhere(`"indoor-training"."${key}" LIKE :${key}`, {
              [key]: `%${value}%`,
            });
        }
      }
    });
    const response = await queryBuilder.getMany();
    console.log(response);
    return queryBuilder.getMany();
  }

  /**
   * Retrieves the details of an indoor training session by ID.
   * @param id - The ID of the indoor training session to retrieve.
   * @returns The found IndoorTraining.
   * @throws IndoorTrainingNotFoundException if the session is not found.
   */
  async detail(id: string): Promise<IndoorTraining> {
    const result = await this.repository.findOneBy({ indoor_training_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new IndoorTrainingNotFoundException();
  }

  /**
   * Creates a new indoor training session.
   * @param payload - Data for creating a new indoor training session.
   * @returns The created IndoorTraining.
   * @throws IndoorTrainingCreateException if creation fails.
   */
  async create(payload: IndoorTrainingCreatePayload): Promise<IndoorTraining> {
    try {
      let resolvedWorkout;
      try {
        resolvedWorkout = await this.workout_service.detail(
          payload.workout.workout_id.toString(),
        );
      } catch (e) {
        resolvedWorkout = null;
      }

      let resolvedIndoorTrainingSubscriptionList;
      try {
        resolvedIndoorTrainingSubscriptionList = await Promise.all(
          payload.indoor_training_subscription_list.map(
            async (subscription) => {
              return await this.indoor_training_subscription_service.detail(
                subscription.indoor_training_subscription_id.toString(),
              );
            },
          ),
        );
      } catch (e) {
        resolvedIndoorTrainingSubscriptionList = [];
      }

      return await this.repository.save(
        Builder<IndoorTraining>()
          .indoor_training_id(UniqueId.generate())
          .title(payload.title)
          .training_date(payload.training_date)
          .start_hours(payload.start_hours)
          .end_hours(payload.end_hours)
          .nb_place(payload.nb_place)
          .nb_subscription(payload.nb_subscription)
          .is_collective(payload.is_collective)
          .workout(Promise.resolve(resolvedWorkout))
          .indoor_training_subscription_list(
            Promise.resolve(resolvedIndoorTrainingSubscriptionList),
          )
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new IndoorTrainingCreateException();
    }
  }

  /**
   * Updates an existing indoor training session.
   * @param payload - Data for updating the session.
   * @returns The updated IndoorTraining.
   * @throws IndoorTrainingUpdateException if update fails.
   */
  async update(payload: IndoorTrainingUpdatePayload): Promise<IndoorTraining> {
    try {
      const detail = await this.detail(payload.indoor_training_id.toString());

      let resolvedWorkout;
      try {
        resolvedWorkout = await this.workout_service.detail(
          payload.workout.workout_id.toString(),
        );
      } catch (e) {
        resolvedWorkout = null;
      }

      let resolvedIndoorTrainingSubscriptionList;
      try {
        resolvedIndoorTrainingSubscriptionList = await Promise.all(
          payload.indoor_training_subscription_list.map(
            async (subscription) => {
              return await this.indoor_training_subscription_service.detail(
                subscription.indoor_training_subscription_id.toString(),
              );
            },
          ),
        );
      } catch (e) {
        resolvedIndoorTrainingSubscriptionList = [];
      }

      detail.title = payload.title;
      detail.training_date = payload.training_date;
      detail.start_hours = payload.start_hours;
      detail.end_hours = payload.end_hours;
      detail.nb_place = payload.nb_place;
      detail.nb_subscription = payload.nb_subscription;
      detail.is_collective = payload.is_collective;
      detail.workout = Promise.resolve(resolvedWorkout);
      detail.indoor_training_subscription_list = Promise.resolve(
        resolvedIndoorTrainingSubscriptionList,
      );
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new IndoorTrainingUpdateException();
    }
  }

  /**
   * Deletes an indoor training session by ID.
   * @param id - The ID of the session to delete.
   * @throws IndoorTrainingDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      console.log(e.message);
      throw new IndoorTrainingDeleteException();
    }
  }
}
