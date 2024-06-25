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
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { ExerciseTrainingService } from './exercise-training.service';
import {
  ExerciseTraining,
  ExerciseTrainingCreatePayload,
  ExerciseTrainingUpdatePayload,
} from './model';
import { ExerciseTrainingFilter } from './model/filter';
import {
  ExerciseTrainingControllerCreate,
  ExerciseTrainingControllerDelete,
  ExerciseTrainingControllerDetail,
  ExerciseTrainingControllerFilter,
  ExerciseTrainingControllerList,
  ExerciseTrainingControllerUpdate,
} from '@common/documentation';

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
  @ApiOperation(ExerciseTrainingControllerCreate)
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
  @ApiOperation(ExerciseTrainingControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of an exercise training session by ID.
   * @param id - The ID of the exercise training session to retrieve.
   * @returns The found ExerciseTraining.
   */
  @ApiOperation(ExerciseTrainingControllerDetail)
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<ExerciseTraining> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter exercise training sessions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of ExerciseTraining entries matching the criteria.
   */
  @ApiOperation(ExerciseTrainingControllerFilter)
  @Post('filter')
  filter(@Body() filter: ExerciseTrainingFilter): Promise<ExerciseTraining[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all exercise training sessions.
   * @returns A list of all ExerciseTraining entries.
   */
  @ApiOperation(ExerciseTrainingControllerList)
  @Get('list')
  getAll(): Promise<ExerciseTraining[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing exercise training session.
   * @param payload - Data for updating the exercise training session.
   * @returns The updated ExerciseTraining.
   */
  @ApiOperation(ExerciseTrainingControllerUpdate)
  @Put('update')
  update(
    @Body() payload: ExerciseTrainingUpdatePayload,
  ): Promise<ExerciseTraining> {
    return this.service.update(payload);
  }
}
