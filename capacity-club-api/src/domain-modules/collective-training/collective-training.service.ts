import { CrudService } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import {
  CollectiveTraining,
  CollectiveTrainingCreatePayload,
  CollectiveTrainingUpdatePayload,
} from './model';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { ExerciseTrainingListException } from 'domain-modules/exercise-training/exercise-training.exception';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import { ulid } from 'ulid';
import {
  CollectiveTrainingCreateException,
  CollectiveTrainingDeleteException,
  CollectiveTrainingNotFoundException,
  CollectiveTrainingUpdateException,
} from './collective-training.exception';
import { CollectiveTrainingFilter } from './model/filter';

@Injectable()
export class CollectiveTrainingService
  implements
    CrudService<
      CollectiveTraining,
      CollectiveTrainingCreatePayload,
      CollectiveTrainingUpdatePayload,
      CollectiveTrainingFilter,
      string
    >
{
  constructor(
    @InjectRepository(CollectiveTraining)
    private readonly repository: Repository<CollectiveTraining>,
  ) {}

  async create(
    payload: CollectiveTrainingCreatePayload,
  ): Promise<CollectiveTraining> {
    try {
      return await this.repository.save(
        Builder<CollectiveTraining>()
          .collective_training_id(ulid())
          .member(payload.member)
          .collective_training_session(payload.collective_training_session)
          .workout(payload.workout)
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new CollectiveTrainingCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new CollectiveTrainingDeleteException();
    }
  }

  async detail(id: string): Promise<CollectiveTraining> {
    const result = await this.repository.findOneBy({
      collective_training_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new CollectiveTrainingNotFoundException();
  }

  filter(filter: CollectiveTrainingFilter): Promise<CollectiveTraining[]> {
    console.log(filter);
    return Promise.resolve([]);
  }

  async getAll(): Promise<CollectiveTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new ExerciseTrainingListException();
    }
  }

  async update(
    payload: CollectiveTrainingUpdatePayload,
  ): Promise<CollectiveTraining> {
    try {
      const detail = await this.detail(payload.collective_training_id);
      detail.member = payload.member;
      detail.collective_training_session = payload.collective_training_session;
      detail.workout = payload.workout;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new CollectiveTrainingUpdateException();
    }
  }
}
