import { UniqueId } from '@common/model';
import { CrudService } from '@domain-modules-shared';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { ExerciseData } from 'domain-modules/exercise-data/model/entity/exercise-data.entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { TrainingCircuitService } from 'domain-modules/training-circuit/training-circuit.service';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import { ExerciseDataService } from './../exercise-data/exercise-data.service';
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import {
  ExerciseTrainingCreateException,
  ExerciseTrainingDeleteException,
  ExerciseTrainingNotFoundException,
  ExerciseTrainingListException,
  ExerciseTrainingUpdateException,
} from './exercise-training.exception';
import { ExerciseTraining } from './model/entity/exercise-training.entity';
import { ExerciseTrainingFilter } from './model/filter/exercise-training.filter';
import { ExerciseTrainingCreatePayload } from './model/payload/exercise-training-create.payload';
import { ExerciseTrainingUpdatePayload } from './model/payload/exercise-training-update.payload';

/**
 * Service for managing exercise training sessions.
 * Implements CRUD operations and filtering for ExerciseTraining entities.
 */
@Injectable()
export class ExerciseTrainingService
  implements
    CrudService<
      ExerciseTraining,
      ExerciseTrainingCreatePayload,
      ExerciseTrainingUpdatePayload,
      ExerciseTrainingFilter,
      string
    >
{
  constructor(
    @InjectRepository(ExerciseTraining)
    private readonly repository: Repository<ExerciseTraining>,
    @Inject(forwardRef(() => ExerciseDataService))
    private readonly exercise_data_service: ExerciseDataService,
    @Inject(forwardRef(() => TrainingCircuitService))
    private readonly training_circuit_service: TrainingCircuitService,
  ) {}

  /**
   * Creates a new exercise training session.
   * @param payload - Data for creating a new exercise training session.
   * @returns The created ExerciseTraining.
   * @throws ExerciseTrainingCreateException if creation fails.
   */
  async create(
    payload: ExerciseTrainingCreatePayload,
  ): Promise<ExerciseTraining> {
    try {
      const resolvedExerciseData = await this.exercise_data_service.detail(
        payload.exercise_data.exercise_data_id.toString(),
      );

      const resolvedTrainingCircuit =
        await this.training_circuit_service.detail(
          payload.training_circuit.training_circuit_id.toString(),
        );

      return await this.repository.save(
        Builder<ExerciseTraining>()
          .exercise_training_id(UniqueId.generate())
          .nb_reps(payload.nb_reps)
          .intensity(payload.intensity)
          .intensityType(payload.intensityType)
          .exercise_data(Promise.resolve(resolvedExerciseData))
          .training_circuit(Promise.resolve(resolvedTrainingCircuit))
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new ExerciseTrainingCreateException();
    }
  }

  /**
   * Deletes an existing exercise training session by ID.
   * @param id - The ID of the exercise training session to delete.
   * @throws ExerciseTrainingDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new ExerciseTrainingDeleteException();
    }
  }

  /**
   * Retrieves the details of an exercise training session by ID.
   * @param id - The ID of the exercise training session to retrieve.
   * @returns The found ExerciseTraining.
   * @throws ExerciseTrainingNotFoundException if the exercise training session is not found.
   */
  async detail(id: string): Promise<ExerciseTraining> {
    const result = await this.repository.findOneBy({
      exercise_training_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new ExerciseTrainingNotFoundException();
  }

  /**
   * Filters exercise training sessions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of ExerciseTraining entries matching the criteria.
   */
  async filter(filter: ExerciseTrainingFilter): Promise<ExerciseTraining[]> {
    const queryBuilder = this.repository.createQueryBuilder('exerciseTraining');

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'exercise_data':
            queryBuilder.andWhere(
              'exerciseTraining.exercise_data = :exercise_data',
              { exercise_data: value },
            );
            break;
          case 'training_circuit':
            queryBuilder.andWhere(
              'exerciseTraining.training_circuit = :training_circuit',
              { training_circuit: value },
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
   * Retrieves all exercise training sessions.
   * @returns A list of all ExerciseTraining entries.
   * @throws ExerciseTrainingListException if retrieval fails.
   */
  async getAll(): Promise<ExerciseTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new ExerciseTrainingListException();
    }
  }

  /**
   * Updates an existing exercise training session.
   * @param payload - Data for updating the exercise training session.
   * @returns The updated ExerciseTraining.
   * @throws ExerciseTrainingUpdateException if update fails.
   */
  async update(
    payload: ExerciseTrainingUpdatePayload,
  ): Promise<ExerciseTraining> {
    try {
      let resolvedExerciseData: ExerciseData;

      try {
        resolvedExerciseData = await this.exercise_data_service.detail(
          payload.exercise_data.exercise_data_id.toString(),
        );
      } catch {
        resolvedExerciseData = null;
      }

      let resolvedTrainingCircuit: TrainingCircuit;

      try {
        resolvedTrainingCircuit = await this.training_circuit_service.detail(
          payload.training_circuit.training_circuit_id.toString(),
        );
      } catch {
        resolvedTrainingCircuit = null;
      }

      const detail = await this.detail(payload.exercise_training_id.toString());
      detail.nb_reps = payload.nb_reps;
      detail.intensity = payload.intensity;
      detail.intensityType = payload.intensityType;
      detail.exercise_data = Promise.resolve(resolvedExerciseData);
      detail.training_circuit = Promise.resolve(resolvedTrainingCircuit);
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new ExerciseTrainingUpdateException();
    }
  }
}
