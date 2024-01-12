import { Injectable } from '@nestjs/common';
import { Workout, WorkoutCreatePayload, WorkoutUpdatePayload } from './model';
import { CrudService, Filter } from '@domain-modules-shared';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { TrainingCircuitUpdateException } from 'domain-modules/training-circuit/training-circuit.exception';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  WorkoutCreateException,
  WorkoutDeleteException,
  WorkoutNotFoundException,
  WorkoutListException,
} from './workout.exception';

@Injectable()
export class WorkoutService
  implements
    CrudService<Workout, WorkoutCreatePayload, WorkoutUpdatePayload, string>
{
  constructor(
    @InjectRepository(Workout)
    private readonly repository: Repository<Workout>,
  ) {}

  async create(payload: WorkoutCreatePayload): Promise<Workout> {
    try {
      return await this.repository.save(
        Builder<Workout>()
          .title(payload.title)
          .training_circuits(
            payload.training_circuits ? payload.training_circuits : [],
          )
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new WorkoutCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new WorkoutDeleteException();
    }
  }

  async detail(id: string): Promise<Workout> {
    const result = await this.repository.findOneBy({ workout_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new WorkoutNotFoundException();
  }

  filter(filter: Filter): Promise<Workout[]> {
    console.log(filter);
    return Promise.resolve([]);
  }

  async getAll(): Promise<Workout[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new WorkoutListException();
    }
  }

  async update(payload: WorkoutUpdatePayload): Promise<Workout> {
    try {
      const detail = await this.detail(payload.workout_id);
      detail.title = payload.title;
      detail.training_circuits = payload.training_circuits
        ? payload.training_circuits
        : [];

      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new TrainingCircuitUpdateException();
    }
  }
}
