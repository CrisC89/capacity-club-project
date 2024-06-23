import { Injectable } from '@nestjs/common';
import { Workout, WorkoutCreatePayload, WorkoutUpdatePayload } from './model';
import { CrudService } from '@domain-modules-shared';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { TrainingCircuitUpdateException } from 'domain-modules/training-circuit/training-circuit.exception';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  WorkoutCreateException,
  WorkoutDeleteException,
  WorkoutNotFoundException,
  WorkoutListException,
} from './workout.exception';
import { WorkoutFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';

/**
 * Service for managing workouts.
 * Implements CRUD operations and filtering for Workout entities.
 */
@Injectable()
export class WorkoutService
  implements
    CrudService<
      Workout,
      WorkoutCreatePayload,
      WorkoutUpdatePayload,
      WorkoutFilter,
      string
    >
{
  constructor(
    @InjectRepository(Workout)
    private readonly repository: Repository<Workout>,
  ) {}

  /**
   * Creates a new workout.
   * @param payload - Data for creating a new workout.
   * @returns The created Workout.
   * @throws WorkoutCreateException if creation fails.
   */
  async create(payload: WorkoutCreatePayload): Promise<Workout> {
    try {
      return await this.repository.save(
        Builder<Workout>()
          .workout_id(UniqueId.generate())
          .title(payload.title)
          .training_circuits(
            payload.training_circuits ? payload.training_circuits : [],
          )
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new WorkoutCreateException();
    }
  }

  /**
   * Deletes a workout by ID.
   * @param id - The ID of the workout to delete.
   * @throws WorkoutDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new WorkoutDeleteException();
    }
  }

  /**
   * Retrieves the details of a workout by ID.
   * @param id - The ID of the workout to retrieve.
   * @returns The found Workout.
   * @throws WorkoutNotFoundException if the workout is not found.
   */
  async detail(id: string): Promise<Workout> {
    const result = await this.repository.findOneBy({ workout_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new WorkoutNotFoundException();
  }

  /**
   * Filters workouts based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of Workout entries matching the criteria.
   */
  filter(filter: WorkoutFilter): Promise<Workout[]> {
    const queryBuilder = this.repository.createQueryBuilder('workout');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`member.${key} = :${key}`, {
            [key]: value,
          });
        } else {
          queryBuilder.andWhere(`member.${key} LIKE :${key}`, {
            [key]: `%${value}%`,
          });
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves all workouts.
   * @returns A list of all Workout entries.
   * @throws WorkoutListException if retrieval fails.
   */
  async getAll(): Promise<Workout[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new WorkoutListException();
    }
  }

  /**
   * Updates an existing workout.
   * @param payload - Data for updating the workout.
   * @returns The updated Workout.
   * @throws TrainingCircuitUpdateException if update fails.
   */
  async update(payload: WorkoutUpdatePayload): Promise<Workout> {
    try {
      const detail = await this.detail(payload.workout_id.toString());
      detail.title = payload.title;
      detail.training_circuits = payload.training_circuits
        ? payload.training_circuits
        : [];

      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new TrainingCircuitUpdateException();
    }
  }
}
