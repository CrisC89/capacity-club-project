import { CrudController } from '@domain-modules-shared';
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { ExerciseTrainingService } from './exercise-training.service';
import {
  ExerciseTraining,
  ExerciseTrainingCreatePayload,
  ExerciseTrainingUpdatePayload,
} from './model';
import { ExerciseTrainingFilter } from './model/filter';

/**
 * Controller for managing exercise training sessions.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating exercise training sessions.
 */

@ApiBearerAuth('access-token')
@ApiTags('Exercise Training')
@Controller('exercise-training')
export class ExerciseTrainingController
  implements
    CrudController<
      ExerciseTraining,
      ExerciseTrainingCreatePayload,
      ExerciseTrainingUpdatePayload,
      ExerciseTrainingFilter,
      string
    >
{
  constructor(private readonly service: ExerciseTrainingService) {}

  /**
   * Endpoint to create a new exercise training session.
   * @param payload - Data for creating a new exercise training session.
   * @returns The created ExerciseTraining.
   */
  @Post('create')
  create(
    @Body() payload: ExerciseTrainingCreatePayload,
  ): Promise<ExerciseTraining> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to delete an exercise training session by ID.
   * @param id - The ID of the exercise training session to delete.
   */
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of an exercise training session by ID.
   * @param id - The ID of the exercise training session to retrieve.
   * @returns The found ExerciseTraining.
   */
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<ExerciseTraining> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter exercise training sessions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of ExerciseTraining entries matching the criteria.
   */
  @Post('filter')
  filter(@Body() filter: ExerciseTrainingFilter): Promise<ExerciseTraining[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all exercise training sessions.
   * @returns A list of all ExerciseTraining entries.
   */
  @Get('list')
  getAll(): Promise<ExerciseTraining[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing exercise training session.
   * @param payload - Data for updating the exercise training session.
   * @returns The updated ExerciseTraining.
   */
  @Put('update')
  update(
    @Body() payload: ExerciseTrainingUpdatePayload,
  ): Promise<ExerciseTraining> {
    return this.service.update(payload);
  }
}
