import { CrudService } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import {
  CollectiveTrainingSession,
  CollectiveTrainingSessionCreatePayload,
  CollectiveTrainingSessionUpdatePayload,
} from './model';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import {
  CollectiveTrainingSessionCreateException,
  CollectiveTrainingSessionDeleteException,
  CollectiveTrainingSessionListException,
  CollectiveTrainingSessionNotFoundException,
  CollectiveTrainingSessionUpdateException,
} from './collective-training-session.exception';
import { isNil } from 'lodash';
import { Builder } from 'builder-pattern';
import { CollectiveTrainingSessionFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';

@Injectable()
export class CollectiveTrainingSessionService
  implements
    CrudService<
      CollectiveTrainingSession,
      CollectiveTrainingSessionCreatePayload,
      CollectiveTrainingSessionUpdatePayload,
      CollectiveTrainingSessionFilter,
      string
    >
{
  constructor(
    @InjectRepository(CollectiveTrainingSession)
    private readonly repository: Repository<CollectiveTrainingSession>,
  ) {}

  async getAll(): Promise<CollectiveTrainingSession[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new CollectiveTrainingSessionListException();
    }
  }

  async filter(
    filter: CollectiveTrainingSessionFilter,
  ): Promise<CollectiveTrainingSession[]> {
    console.log(filter);
    return Promise.resolve([]);
  }
  async detail(id: string): Promise<CollectiveTrainingSession> {
    const result = await this.repository.findOneBy({
      collective_training_session_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new CollectiveTrainingSessionNotFoundException();
  }
  async create(
    payload: CollectiveTrainingSessionCreatePayload,
  ): Promise<CollectiveTrainingSession> {
    try {
      return await this.repository.save(
        Builder<CollectiveTrainingSession>()
          .collective_training_session_id(UniqueId.generate())
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
      throw new CollectiveTrainingSessionCreateException();
    }
  }
  async update(
    payload: CollectiveTrainingSessionUpdatePayload,
  ): Promise<CollectiveTrainingSession> {
    try {
      const detail = await this.detail(
        payload.collective_training_session_id.toString(),
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
      throw new CollectiveTrainingSessionUpdateException();
    }
  }
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      console.log(e.message);
      throw new CollectiveTrainingSessionDeleteException();
    }
  }
}
