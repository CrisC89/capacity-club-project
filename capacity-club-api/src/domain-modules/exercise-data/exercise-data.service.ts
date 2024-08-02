import { CrudService } from '@domain-modules-shared';
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  ExerciseDataCreateException,
  ExerciseDataDeleteException,
  ExerciseDataNotFoundException,
  ExerciseDataListException,
  ExerciseDataUpdateException,
} from './exercise-data.exception';
import { UniqueId } from '@common/model/unique-id';
import { ExerciseTrainingService } from 'domain-modules/exercise-training/exercise-training.service';
import { ExerciseTraining } from 'domain-modules/exercise-training/model/entity/exercise-training.entity';
import { ExerciseData } from './model/entity/exercise-data.entity';
import { ExerciseDataFilter } from './model/filter/exercise-data.filter';
import { ExerciseDataCreatePayload } from './model/payload/exercise-data-create.payload';
import { ExerciseDataUpdatePayload } from './model/payload/exercise-data-update.payload';

/**
 * Service for managing exercise data.
 * Implements CRUD operations and filtering for ExerciseData entities.
 */
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
    @Inject(forwardRef(() => ExerciseTrainingService))
    private readonly exercise_training_service: ExerciseTrainingService,
  ) {}

  /**
   * Creates a new exercise data entry.
   * @param payload - Data for creating a new exercise.
   * @returns The created ExerciseData.
   * @throws ExerciseDataCreateException if creation fails.
   */
  async create(payload: ExerciseDataCreatePayload): Promise<ExerciseData> {
    try {
      return await this.repository.save(
        Builder<ExerciseData>()
          .exercise_data_id(UniqueId.generate())
          .title(payload.title)
          .description(payload.description ?? [])
          .categories(payload.categories ?? [])
          .video_youtube_link(payload.video_youtube_link ?? '')
          .video_asset_link(payload.video_asset_link ?? '')
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new ExerciseDataCreateException();
    }
  }
  /**
   * Deletes an existing exercise data entry by ID.
   * @param id - The ID of the exercise data to delete.
   * @throws ExerciseDataDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new ExerciseDataDeleteException();
    }
  }

  /**
   * Retrieves the details of an exercise data entry by ID.
   * @param id - The ID of the exercise data to retrieve.
   * @returns The found ExerciseData.
   * @throws ExerciseDataNotFoundException if the exercise data is not found.
   */
  async detail(id: string): Promise<ExerciseData> {
    const result = await this.repository.findOneBy({ exercise_data_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new ExerciseDataNotFoundException();
  }

  /**
   * Filters exercise data based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of ExerciseData entries matching the criteria.
   */
  async filter(filter: ExerciseDataFilter): Promise<ExerciseData[]> {
    const queryBuilder = this.repository.createQueryBuilder('exerciseData');

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'title':
            queryBuilder.andWhere('exerciseData.title LIKE :title', {
              title: `%${value}%`,
            });
            break;
          case 'categories':
            if (Array.isArray(value) && value.length > 0) {
              queryBuilder.andWhere(
                'exerciseData.categories IN (:...categories)',
                { categories: value },
              );
            }
            break;
          default:
            break;
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves all exercise data entries.
   * @returns A list of all ExerciseData entries.
   * @throws ExerciseDataListException if retrieval fails.
   */
  async getAll(): Promise<ExerciseData[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new ExerciseDataListException();
    }
  }

  /**
   * Updates an existing exercise data entry.
   * @param payload - Data for updating the exercise.
   * @returns The updated ExerciseData.
   * @throws ExerciseDataUpdateException if update fails.
   */
  async update(payload: ExerciseDataUpdatePayload): Promise<ExerciseData> {
    try {
      const detail = await this.detail(payload.exercise_data_id.toString());
      detail.title = payload.title;
      detail.description = payload.description;
      detail.categories = payload.categories;
      detail.video_youtube_link = payload.video_youtube_link;
      detail.video_asset_link = payload.video_asset_link;

      let resolved_exercise_training_list: ExerciseTraining[];
      try {
        resolved_exercise_training_list = await Promise.all(
          payload.exercise_training_list.map(async (exercise_training) => {
            return await this.exercise_training_service.detail(
              exercise_training.exercise_training_id.toString(),
            );
          }),
        );
      } catch {
        resolved_exercise_training_list = [];
      }

      detail.exercise_training_list = Promise.resolve(
        resolved_exercise_training_list,
      );

      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new ExerciseDataUpdateException();
    }
  }
}
