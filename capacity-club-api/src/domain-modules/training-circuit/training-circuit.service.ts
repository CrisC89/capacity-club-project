import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  TrainingCircuit,
  TrainingCircuitCreatePayload,
  TrainingCircuitUpdatePayload,
} from './model';
import {
  TrainingCircuitCreateException,
  TrainingCircuitDeleteException,
  TrainingCircuitNotFoundException,
  TrainingCircuitListException,
  TrainingCircuitUpdateException,
} from './training-circuit.exception';
import { CrudService } from '@domain-modules-shared';
import { TrainingCircuitFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';

/**
 * Service for managing training circuits.
 * Implements CRUD operations and filtering for TrainingCircuit entities.
 */
@Injectable()
export class TrainingCircuitService
  implements
    CrudService<
      TrainingCircuit,
      TrainingCircuitCreatePayload,
      TrainingCircuitUpdatePayload,
      TrainingCircuitFilter,
      string
    >
{
  constructor(
    @InjectRepository(TrainingCircuit)
    private readonly repository: Repository<TrainingCircuit>,
  ) {}

  /**
   * Creates a new training circuit.
   * @param payload - Data for creating a new training circuit.
   * @returns The created TrainingCircuit.
   * @throws TrainingCircuitCreateException if creation fails.
   */
  async create(
    payload: TrainingCircuitCreatePayload,
  ): Promise<TrainingCircuit> {
    try {
      return await this.repository.save(
        Builder<TrainingCircuit>()
          .training_circuit_id(UniqueId.generate())
          .title(payload.title)
          .exercise_training_list(
            Promise.resolve(payload.exercise_training_list),
          )
          .workout(Promise.resolve(payload.workout))
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new TrainingCircuitCreateException();
    }
  }

  /**
   * Deletes an existing training circuit by ID.
   * @param id - The ID of the training circuit to delete.
   * @throws TrainingCircuitDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new TrainingCircuitDeleteException();
    }
  }

  /**
   * Retrieves the details of a training circuit by ID.
   * @param id - The ID of the training circuit to retrieve.
   * @returns The found TrainingCircuit.
   * @throws TrainingCircuitNotFoundException if the training circuit is not found.
   */
  async detail(id: string): Promise<TrainingCircuit> {
    const result = await this.repository.findOneBy({ training_circuit_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new TrainingCircuitNotFoundException();
  }

  /**
   * Filters training circuits based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of TrainingCircuit entries matching the criteria.
   */
  async filter(filter: TrainingCircuitFilter): Promise<TrainingCircuit[]> {
    const queryBuilder = this.repository.createQueryBuilder('training-circuit');

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'title':
            queryBuilder.andWhere('training-circuit.title LIKE :title', {
              title: `%${value}%`,
            });
            break;
          case 'exercise_training_list':
            if (Array.isArray(value) && value.length > 0) {
              queryBuilder.andWhere(
                'training-circuit.exercise_training_list IN (:...exercise_training_list)',
                { exercise_training_list: value },
              );
            }
            break;
          case 'workout':
            queryBuilder.andWhere('training-circuit.workout = :workout', {
              workout: value,
            });
            break;
          default:
            break;
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves all training circuits.
   * @returns A list of all TrainingCircuit entries.
   * @throws TrainingCircuitListException if retrieval fails.
   */
  async getAll(): Promise<TrainingCircuit[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new TrainingCircuitListException();
    }
  }

  /**
   * Updates an existing training circuit.
   * @param payload - Data for updating the training circuit.
   * @returns The updated TrainingCircuit.
   * @throws TrainingCircuitUpdateException if update fails.
   */
  async update(
    payload: TrainingCircuitUpdatePayload,
  ): Promise<TrainingCircuit> {
    try {
      const detail = await this.detail(payload.training_circuit_id.toString());
      detail.title = payload.title;
      detail.exercise_training_list = Promise.resolve(
        payload.exercise_training_list,
      );
      detail.workout = Promise.resolve(payload.workout);
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new TrainingCircuitUpdateException();
    }
  }
}
