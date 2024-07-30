import { Injectable } from '@nestjs/common';
import {
  ExerciseTraining,
  ExerciseTrainingCreatePayload,
  ExerciseTrainingUpdatePayload,
} from './model';
import { CrudService } from '@domain-modules-shared';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  ExerciseTrainingCreateException,
  ExerciseTrainingDeleteException,
  ExerciseTrainingNotFoundException,
  ExerciseTrainingListException,
  ExerciseTrainingUpdateException,
} from './exercise-training.exception';
import { ExerciseTrainingFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';

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
      return await this.repository.save(
        Builder<ExerciseTraining>()
          .exercise_training_id(UniqueId.generate())
          .nb_reps(payload.nb_reps)
          .intensity(payload.intensity)
          .intensityType(payload.intensityType)
          .exercise_data(Promise.resolve(payload.exercise_data))
          .training_circuit(Promise.resolve(payload.training_circuit))
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
      const detail = await this.detail(payload.exercise_training_id.toString());
      detail.nb_reps = payload.nb_reps;
      detail.intensity = payload.intensity;
      detail.intensityType = payload.intensityType;
      detail.exercise_data = Promise.resolve(payload.exercise_data);
      detail.training_circuit = Promise.resolve(payload.training_circuit);
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new ExerciseTrainingUpdateException();
    }
  }
}
