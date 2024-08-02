import { CrudService } from '@domain-modules-shared';
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { HomeTrainingFilter } from './model/filter/home-training.filter';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import {
  HomeTrainingCreateException,
  HomeTrainingDeleteException,
  HomeTrainingListException,
  HomeTrainingNotFoundException,
  HomeTrainingUpdateException,
} from './home-training.exception';
import { isNil } from 'lodash';
import { UniqueId } from '@common/model';
import { Builder } from 'builder-pattern';
import { MemberHomeTrainingService } from 'domain-modules/member-home-training/member-home-training.service';
import { WorkoutService } from 'domain-modules/workout/workout.service';
import { HomeTraining } from './model/entity/home-training.entity';
import { HomeTrainingCreatePayload } from './model/payload/home-training-create.payload';
import { HomeTrainingUpdatePayload } from './model/payload/home-training-update.payload';

/**
 * Service for managing home training programs.
 * Implements CRUD operations and filtering for HomeTraining entities.
 */
@Injectable()
export class HomeTrainingService
  implements
    CrudService<
      HomeTraining,
      HomeTrainingCreatePayload,
      HomeTrainingUpdatePayload,
      HomeTrainingFilter,
      string
    >
{
  constructor(
    @InjectRepository(HomeTraining)
    private readonly repository: Repository<HomeTraining>,
    @Inject(forwardRef(() => MemberHomeTrainingService))
    private readonly member_home_training_service: MemberHomeTrainingService,
    @Inject(forwardRef(() => WorkoutService))
    private readonly workout_service: WorkoutService,
  ) {}

  /**
   * Retrieves all home training programs.
   * @returns A list of all HomeTraining entries.
   * @throws HomeTrainingListException if retrieval fails.
   */
  async getAll(): Promise<HomeTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new HomeTrainingListException();
    }
  }

  /**
   * Filters home training programs based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of HomeTraining entries matching the criteria.
   */
  async filter(filter: HomeTrainingFilter): Promise<HomeTraining[]> {
    const queryBuilder = this.repository.createQueryBuilder('homeTraining');

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'title':
            queryBuilder.andWhere('homeTraining.title LIKE :title', {
              title: `%${value}%`,
            });
            break;
          case 'nb_week':
            queryBuilder.andWhere('homeTraining.nb_week = :nb_week', {
              nb_week: value,
            });
            break;
          case 'nb_training_by_week':
            queryBuilder.andWhere(
              'homeTraining.nb_training_by_week = :nb_training_by_week',
              { nb_training_by_week: value },
            );
            break;
          case 'workouts':
            if (Array.isArray(value) && value.length > 0) {
              queryBuilder.andWhere('homeTraining.workouts IN (:...workouts)', {
                workouts: value,
              });
            }
            break;
          default:
            break;
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves the details of a home training program by ID.
   * @param id - The ID of the home training program to retrieve.
   * @returns The found HomeTraining.
   * @throws HomeTrainingNotFoundException if the home training program is not found.
   */
  async detail(id: string): Promise<HomeTraining> {
    const result = await this.repository.findOneBy({ home_training_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new HomeTrainingNotFoundException();
  }

  /**
   * Creates a new home training program.
   * @param payload - Data for creating a new home training program.
   * @returns The created HomeTraining.
   * @throws HomeTrainingCreateException if creation fails.
   */
  async create(payload: HomeTrainingCreatePayload): Promise<HomeTraining> {
    try {
      let resolvedWorkouts;
      try {
        resolvedWorkouts = await Promise.all(
          payload.workouts.map(async (workout) => {
            return await this.workout_service.detail(
              workout.workout_id.toString(),
            );
          }),
        );
      } catch (e) {
        resolvedWorkouts = [];
      }

      let resolvedMemberHomeTrainings;
      try {
        resolvedMemberHomeTrainings = await Promise.all(
          payload.member_home_trainings.map(async (memberHomeTraining) => {
            return await this.member_home_training_service.detail(
              memberHomeTraining.member_home_training_id.toString(),
            );
          }),
        );
      } catch (e) {
        resolvedMemberHomeTrainings = [];
      }

      return await this.repository.save(
        Builder<HomeTraining>()
          .home_training_id(UniqueId.generate())
          .title(payload.title)
          .nb_week(payload.nb_week)
          .nb_training_by_week(payload.nb_training_by_week)
          .price(payload.price)
          .workouts(Promise.resolve(resolvedWorkouts))
          .member_home_trainings(Promise.resolve(resolvedMemberHomeTrainings))
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new HomeTrainingCreateException();
    }
  }

  /**
   * Updates an existing home training program.
   * @param payload - Data for updating the home training program.
   * @returns The updated HomeTraining.
   * @throws HomeTrainingUpdateException if update fails.
   */
  async update(payload: HomeTrainingUpdatePayload): Promise<HomeTraining> {
    try {
      const detail = await this.detail(payload.home_training_id.toString());

      detail.title = payload.title;
      detail.nb_week = payload.nb_week;
      detail.nb_training_by_week = payload.nb_training_by_week;
      detail.price = payload.price;

      let resolvedWorkouts;
      try {
        resolvedWorkouts = await Promise.all(
          payload.workouts.map(async (workout) => {
            return await this.workout_service.detail(
              workout.workout_id.toString(),
            );
          }),
        );
      } catch (e) {
        resolvedWorkouts = [];
      }

      let resolvedMemberHomeTrainings;
      try {
        resolvedMemberHomeTrainings = await Promise.all(
          payload.member_home_trainings.map(async (memberHomeTraining) => {
            return await this.member_home_training_service.detail(
              memberHomeTraining.member_home_training_id.toString(),
            );
          }),
        );
      } catch (e) {
        resolvedMemberHomeTrainings = [];
      }

      detail.workouts = Promise.resolve(resolvedWorkouts);
      detail.member_home_trainings = Promise.resolve(
        resolvedMemberHomeTrainings,
      );

      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new HomeTrainingUpdateException();
    }
  }
  /**
   * Deletes an existing home training program by ID.
   * @param id - The ID of the home training program to delete.
   * @throws HomeTrainingDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      console.log(e.message);
      throw new HomeTrainingDeleteException();
    }
  }
}
