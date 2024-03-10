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
import { ulid } from 'ulid';
import { ExerciseTrainingFilter } from './model/filter';

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
  async create(
    payload: ExerciseTrainingCreatePayload,
  ): Promise<ExerciseTraining> {
    try {
      return await this.repository.save(
        Builder<ExerciseTraining>()
          .exercise_training_id(ulid())
          .title(payload.title)
          .nb_reps(payload.nb_reps)
          .intensity(payload.intensity)
          .member_feedback(payload.member_feedback)
          .member_note(payload.member_note)
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new ExerciseTrainingCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new ExerciseTrainingDeleteException();
    }
  }

  async detail(id: string): Promise<ExerciseTraining> {
    const result = await this.repository.findOneBy({
      exercise_training_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new ExerciseTrainingNotFoundException();
  }

  filter(filter: ExerciseTrainingFilter): Promise<ExerciseTraining[]> {
    console.log(filter);
    return Promise.resolve([]);
  }

  async getAll(): Promise<ExerciseTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new ExerciseTrainingListException();
    }
  }

  async update(
    payload: ExerciseTrainingUpdatePayload,
  ): Promise<ExerciseTraining> {
    try {
      const detail = await this.detail(payload.exercise_training_id);
      detail.title = payload.title;
      detail.nb_reps = payload.nb_reps;
      detail.intensity = payload.intensity;
      detail.member_feedback = payload.member_feedback;
      detail.member_note = payload.member_note;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new ExerciseTrainingUpdateException();
    }
  }
}
