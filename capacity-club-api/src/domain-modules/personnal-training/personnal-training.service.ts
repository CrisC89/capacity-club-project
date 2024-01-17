import { CrudService, Filter } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import {
  PersonnalTraining,
  PersonnalTrainingCreatePayload,
  PersonnalTrainingUpdatePayload,
} from './model';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ulid } from 'ulid';
import {
  PersonnalTrainingCreateException,
  PersonnalTrainingDeleteException,
  PersonnalTrainingListException,
  PersonnalTrainingNotFoundException,
  PersonnalTrainingUpdateException,
} from './personnal-training.exception';
import { Builder } from 'builder-pattern';
import { isNil } from 'lodash';

@Injectable()
export class PersonnalTrainingService
  implements
    CrudService<
      PersonnalTraining,
      PersonnalTrainingCreatePayload,
      PersonnalTrainingUpdatePayload,
      string
    >
{
  constructor(
    @InjectRepository(PersonnalTraining)
    private readonly repository: Repository<PersonnalTraining>,
  ) {}

  async getAll(): Promise<PersonnalTraining[]> {
    try {
      return this.repository.find();
    } catch (e) {
      throw new PersonnalTrainingListException();
    }
  }
  async filter(filter: Filter): Promise<PersonnalTraining[]> {
    console.log(filter);
    return Promise.resolve([]);
  }
  async detail(id: string): Promise<PersonnalTraining> {
    const result = await this.repository.findOneBy({
      personnal_training_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new PersonnalTrainingNotFoundException();
  }
  async create(
    payload: PersonnalTrainingCreatePayload,
  ): Promise<PersonnalTraining> {
    try {
      return await this.repository.save(
        Builder<PersonnalTraining>()
          .personnal_training_id(ulid())
          .training_start_date(payload.training_start_date)
          .training_end_date(payload.training_end_date)
          .member(payload.member)
          .workouts(payload.workouts)
          .build(),
      );
    } catch (e) {
      throw new PersonnalTrainingCreateException();
    }
  }
  async update(
    payload: PersonnalTrainingUpdatePayload,
  ): Promise<PersonnalTraining> {
    try {
      const detail = await this.detail(payload.personnal_training_id);
      detail.title = payload.title;
      detail.training_start_date = payload.training_start_date;
      detail.training_end_date = payload.training_end_date;
      detail.member = payload.member;
      detail.workouts = payload.workouts;
      return await this.repository.save(detail);
    } catch (e) {
      throw new PersonnalTrainingUpdateException();
    }
  }
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new PersonnalTrainingDeleteException();
    }
  }
}
