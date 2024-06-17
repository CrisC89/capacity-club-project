import { CrudService } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import {
  CollectiveTraining,
  CollectiveTrainingCreatePayload,
  CollectiveTrainingUpdatePayload,
} from './model';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import {
  CollectiveTrainingCreateException,
  CollectiveTrainingDeleteException,
  CollectiveTrainingListException,
  CollectiveTrainingNotFoundException,
  CollectiveTrainingUpdateException,
} from './collective-training.exception';
import { isNil } from 'lodash';
import { Builder } from 'builder-pattern';
import { CollectiveTrainingFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';

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

  async getAll(): Promise<CollectiveTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new CollectiveTrainingListException();
    }
  }

  async filter(
    filter: CollectiveTrainingFilter,
  ): Promise<CollectiveTraining[]> {
    console.log(filter);
    return Promise.resolve([]);
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
  async create(
    payload: CollectiveTrainingCreatePayload,
  ): Promise<CollectiveTraining> {
    try {
      return await this.repository.save(
        Builder<CollectiveTraining>()
          .collective_training_id(UniqueId.generate())
          .title(payload.title)
          .training_date(payload.training_date)
          .start_hours(payload.start_hours)
          .end_hours(payload.end_hours)
          .nb_place(payload.nb_place)
          .nb_subscription(payload.nb_subscription)
          .workout(payload.workout)
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new CollectiveTrainingCreateException();
    }
  }
  async update(
    payload: CollectiveTrainingUpdatePayload,
  ): Promise<CollectiveTraining> {
    try {
      const detail = await this.detail(
        payload.collective_training_id.toString(),
      );
      detail.title = payload.title;
      detail.training_date = payload.training_date;
      detail.start_hours = payload.start_hours;
      detail.end_hours = payload.end_hours;
      detail.nb_place = payload.nb_place;
      detail.nb_subscription = payload.nb_subscription;
      detail.workout = payload.workout;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new CollectiveTrainingUpdateException();
    }
  }
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      console.log(e.message);
      throw new CollectiveTrainingDeleteException();
    }
  }
}
