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

  async create(
    payload: TrainingCircuitCreatePayload,
  ): Promise<TrainingCircuit> {
    try {
      return await this.repository.save(
        Builder<TrainingCircuit>()
          .training_circuit_id(UniqueId.generate())
          .title(payload.title)
          .exercise_training_list(
            payload.exercise_training_list
              ? payload.exercise_training_list
              : [],
          )
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new TrainingCircuitCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new TrainingCircuitDeleteException();
    }
  }

  async detail(id: string): Promise<TrainingCircuit> {
    const result = await this.repository.findOneBy({ training_circuit_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new TrainingCircuitNotFoundException();
  }

  filter(filter: TrainingCircuitFilter): Promise<TrainingCircuit[]> {
    const queryBuilder = this.repository.createQueryBuilder('training-circuit');

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

  async getAll(): Promise<TrainingCircuit[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new TrainingCircuitListException();
    }
  }

  async update(
    payload: TrainingCircuitUpdatePayload,
  ): Promise<TrainingCircuit> {
    try {
      const detail = await this.detail(payload.training_circuit_id.toString());
      detail.title = payload.title;
      detail.exercise_training_list = payload.exercise_training_list
        ? payload.exercise_training_list
        : [];

      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new TrainingCircuitUpdateException();
    }
  }
}
