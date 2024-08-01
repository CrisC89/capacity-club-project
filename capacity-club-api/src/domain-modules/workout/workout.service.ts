import { forwardRef, Inject, Injectable } from '@nestjs/common';
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
import { TrainingCircuit } from 'domain-modules/training-circuit/model';
import { TrainingCircuitService } from 'domain-modules/training-circuit/training-circuit.service';
import { HomeTrainingService } from 'domain-modules/home-training/home-training.service';
import { IndoorTrainingService } from 'domain-modules/indoor-training/indoor-training.service';

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
    @Inject(forwardRef(() => TrainingCircuitService))
    private readonly training_circuit_service: TrainingCircuitService,
    @Inject(forwardRef(() => HomeTrainingService))
    private readonly home_training_service: HomeTrainingService,
    @Inject(forwardRef(() => IndoorTrainingService))
    private readonly indoor_training_service: IndoorTrainingService,
  ) {}
  /**
   * Creates a new workout.
   * @param payload - Data for creating a new workout.
   * @returns The created Workout.
   * @throws WorkoutCreateException if creation fails.
   */
  async create(payload: WorkoutCreatePayload): Promise<Workout> {
    try {
      let resolvedTrainingCircuits;
      try {
        resolvedTrainingCircuits = await Promise.all(
          payload.training_circuits.map(async (training_circuit) => {
            return await this.training_circuit_service.detail(
              training_circuit.training_circuit_id.toString(),
            );
          }),
        );
      } catch (e) {
        console.log('Error resolving training circuits:', e.message);
        resolvedTrainingCircuits = [];
      }

      let resolvedHomeTraining;
      try {
        resolvedHomeTraining = await this.home_training_service.detail(
          payload.home_training.home_training_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving home training:', e.message);
        resolvedHomeTraining = null;
      }

      let resolvedIndoorTraining;
      try {
        resolvedIndoorTraining = await this.indoor_training_service.detail(
          payload.indoor_training.indoor_training_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving indoor training:', e.message);
        resolvedIndoorTraining = null;
      }

      return await this.repository.save(
        Builder<Workout>()
          .workout_id(UniqueId.generate())
          .title(payload.title)
          .training_circuits(Promise.resolve(resolvedTrainingCircuits))
          .home_training(Promise.resolve(resolvedHomeTraining))
          .indoor_training(Promise.resolve(resolvedIndoorTraining))
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
  async filter(filter: WorkoutFilter): Promise<Workout[]> {
    const queryBuilder = this.repository.createQueryBuilder('workout');

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'title':
            queryBuilder.andWhere('workout.title LIKE :title', {
              title: `%${value}%`,
            });
            break;
          case 'training_circuits':
            if (Array.isArray(value) && value.length > 0) {
              queryBuilder.andWhere(
                'workout.training_circuits IN (:...training_circuits)',
                { training_circuits: value },
              );
            }
            break;
          case 'home_training':
            queryBuilder.andWhere('workout.home_training = :home_training', {
              home_training: value,
            });
            break;
          case 'indoor_training':
            queryBuilder.andWhere(
              'workout.indoor_training = :indoor_training',
              { indoor_training: value },
            );
            break;
          default:
            break;
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
    let resolvedTrainingCircuits;
    try {
      resolvedTrainingCircuits = await Promise.all(
        payload.training_circuits.map(async (training_circuit) => {
          return await this.training_circuit_service.detail(
            training_circuit.training_circuit_id.toString(),
          );
        }),
      );
    } catch (e) {
      console.log('Error resolving training circuits:', e.message);
      resolvedTrainingCircuits = [];
    }

    let resolvedHomeTraining;
    try {
      resolvedHomeTraining = await this.home_training_service.detail(
        payload.home_training.home_training_id.toString(),
      );
    } catch (e) {
      console.log('Error resolving home training:', e.message);
      resolvedHomeTraining = null;
    }

    let resolvedIndoorTraining;
    try {
      resolvedIndoorTraining = await this.indoor_training_service.detail(
        payload.indoor_training.indoor_training_id.toString(),
      );
    } catch (e) {
      console.log('Error resolving indoor training:', e.message);
      resolvedIndoorTraining = null;
    }
    try {
      const detail = await this.detail(payload.workout_id.toString());
      detail.title = payload.title;
      detail.training_circuits = Promise.resolve(resolvedTrainingCircuits);
      detail.home_training = Promise.resolve(resolvedHomeTraining);
      detail.indoor_training = Promise.resolve(resolvedIndoorTraining);

      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new TrainingCircuitUpdateException();
    }
  }
}
