import { CrudService } from './../shared/model/interface/crud-service.interface';
import { Injectable } from '@nestjs/common';
import {
  IndoorTraining,
  IndoorTrainingCreatePayload,
  IndoorTrainingFilter,
  IndoorTrainingUpdatePayload,
} from './model';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import {
  IndoorTrainingCreateException,
  IndoorTrainingDeleteException,
  IndoorTrainingListException,
  IndoorTrainingNotFoundException,
  IndoorTrainingUpdateException,
} from './indoor-training.exception';
import { isNil } from 'lodash';
import { UniqueId } from '@common/model';
import { Builder } from 'builder-pattern';
import { Brackets } from 'typeorm';

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
            const year: number = date.getUTCFullYear(); // Utilisez number pour TypeScript
            const month: number = date.getUTCMonth() + 1; // Mois sont 0-indexés, donc ajoutez 1
            const day: number = date.getUTCDate();

            // Affichez les valeurs pour débogage
            console.log(`Original date: ${date.toISOString()}`);
            console.log(`Year: ${year}`);
            console.log(`Month: ${month}`);
            console.log(`Day: ${day}`);

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

  /*
  async filter(filter: IndoorTrainingFilter): Promise<IndoorTraining[]> {
    const queryBuilder = this.repository.createQueryBuilder('indoor-training');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        console.log(`Key: ${key}, Value: ${value}, Type: ${typeof value}`);

        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`"indoor-training"."${key}" = :${key}`, {
            [key]: value,
          });
        } else if (value instanceof Date) {
          // Format de la date en YYYY-MM-DD
          const startOfDay = value.toISOString().split('T')[0] + 'T00:00:00Z';
          const endOfDay =
            new Date(value.getTime() + 24 * 60 * 60 * 1000 - 1)
              .toISOString()
              .split('T')[0] + 'T23:59:59Z';
          queryBuilder.andWhere(
            `"indoor-training"."${key}" BETWEEN :startOfDay AND :endOfDay`,
            {
              startOfDay,
              endOfDay,
            },
          );
        } else {
          queryBuilder.andWhere(`"indoor-training"."${key}" LIKE :${key}`, {
            [key]: `%${value}%`,
          });
        }
      }
    });

    return queryBuilder.getMany();
  }
  
  */
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
          .workout(Promise.resolve(payload.workout))
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
      detail.title = payload.title;
      detail.training_date = payload.training_date;
      detail.start_hours = payload.start_hours;
      detail.end_hours = payload.end_hours;
      detail.nb_place = payload.nb_place;
      detail.nb_subscription = payload.nb_subscription;
      detail.is_collective = payload.is_collective;
      detail.workout = Promise.resolve(payload.workout);
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
