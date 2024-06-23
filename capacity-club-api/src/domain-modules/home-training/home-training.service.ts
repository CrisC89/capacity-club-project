import { CrudService } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import { HomeTraining } from './model/entity';
import {
  HomeTrainingCreatePayload,
  HomeTrainingUpdatePayload,
} from './model/payload';
import { HomeTrainingFilter } from './model/filter/home-training.filter';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import {
  HomeTrainingCreateException,
  HomeTrainingDeleteException,
  HomeTrainingListException,
  HomeTrainingNotFoundException,
  HomeTrainingUpdateException,
} from './home-training.exception';
import { isNil } from 'lodash';
import { UniqueId } from '@common/model';
import { Builder } from 'builder-pattern';

@Injectable()
export class HomeTrainingService
  implements
    CrudService<
      HomeTraining,
      HomeTrainingCreatePayload,
      HomeTrainingUpdatePayload,
      HomeTrainingFilter,
      string
    >
{
  constructor(
    @InjectRepository(HomeTraining)
    private readonly repository: Repository<HomeTraining>,
  ) {}
  async getAll(): Promise<HomeTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new HomeTrainingListException();
    }
  }
  async filter(filter: HomeTrainingFilter): Promise<HomeTraining[]> {
    const queryBuilder = this.repository.createQueryBuilder('home-training');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`home-training.${key} = :${key}`, {
            [key]: value,
          });
        } else {
          queryBuilder.andWhere(`home-training.${key} LIKE :${key}`, {
            [key]: `%${value}%`,
          });
        }
      }
    });

    return queryBuilder.getMany();
  }
  async detail(id: string): Promise<HomeTraining> {
    const result = await this.repository.findOneBy({ home_training_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new HomeTrainingNotFoundException();
  }
  async create(payload: HomeTrainingCreatePayload): Promise<HomeTraining> {
    try {
      return await this.repository.save(
        Builder<HomeTraining>()
          .home_training_id(UniqueId.generate())
          .title(payload.title)
          .nb_week(payload.nb_week)
          .nb_training_by_week(payload.nb_training_by_week)
          .workouts(payload.workouts)
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new HomeTrainingCreateException();
    }
  }
  async update(payload: HomeTrainingUpdatePayload): Promise<HomeTraining> {
    try {
      const detail = await this.detail(payload.home_training_id.toString());
      detail.title = payload.title;
      detail.nb_week = payload.nb_week;
      detail.nb_training_by_week = payload.nb_training_by_week;
      detail.workouts = payload.workouts;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new HomeTrainingUpdateException();
    }
  }
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      console.log(e.message);
      throw new HomeTrainingDeleteException();
    }
  }
}
