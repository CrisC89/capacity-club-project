import { CrudService } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  ExerciseData,
  ExerciseDataCreatePayload,
  ExerciseDataUpdatePayload,
} from './model';
import {
  ExerciseDataCreateException,
  ExerciseDataDeleteException,
  ExerciseDataNotFoundException,
  ExerciseDataListException,
  ExerciseDataUpdateException,
} from './exercise-data.exception';
import { ExerciseDataFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';

@Injectable()
export class ExerciseDataService
  implements
    CrudService<
      ExerciseData,
      ExerciseDataCreatePayload,
      ExerciseDataUpdatePayload,
      ExerciseDataFilter,
      string
    >
{
  constructor(
    @InjectRepository(ExerciseData)
    private readonly repository: Repository<ExerciseData>,
  ) {}
  async create(payload: ExerciseDataCreatePayload): Promise<ExerciseData> {
    try {
      return await this.repository.save(
        Builder<ExerciseData>()
          .exercise_data_id(UniqueId.generate())
          .title(payload.title)
          .description(payload.description)
          .categories(payload.categories)
          .video_youtube_link(payload.video_youtube_link)
          .video_asset_link(payload.video_asset_link)
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new ExerciseDataCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new ExerciseDataDeleteException();
    }
  }

  async detail(id: string): Promise<ExerciseData> {
    const result = await this.repository.findOneBy({ exercise_data_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new ExerciseDataNotFoundException();
  }

  filter(filter: ExerciseDataFilter): Promise<ExerciseData[]> {
    const queryBuilder = this.repository.createQueryBuilder('exercise-data');

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

  async getAll(): Promise<ExerciseData[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new ExerciseDataListException();
    }
  }

  async update(payload: ExerciseDataUpdatePayload): Promise<ExerciseData> {
    try {
      const detail = await this.detail(payload.exercise_data_id.toString());
      detail.title = payload.title;
      detail.description = payload.description;
      detail.categories = payload.categories;
      detail.video_youtube_link = payload.video_youtube_link;
      detail.video_asset_link = payload.video_asset_link;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new ExerciseDataUpdateException();
    }
  }
}
