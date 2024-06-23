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
import { Workout, WorkoutCreatePayload, WorkoutUpdatePayload } from './model';
import { CrudController } from '@domain-modules-shared';
import { WorkoutService } from './workout.service';
import { WorkoutFilter } from './model/filter';

/**
 * Controller for managing workouts.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating workouts.
 */

@ApiBearerAuth('access-token')
@ApiTags('Workout')
@Controller('workout')
export class WorkoutController
  implements
    CrudController<
      Workout,
      WorkoutCreatePayload,
      WorkoutUpdatePayload,
      WorkoutFilter,
      string
    >
{
  constructor(private readonly service: WorkoutService) {}

  /**
   * Endpoint to create a new workout.
   * @param payload - Data for creating a new workout.
   * @returns The created Workout.
   */
  @Post('create')
  create(@Body() payload: WorkoutCreatePayload): Promise<Workout> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to delete a workout by ID.
   * @param id - The ID of the workout to delete.
   */
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of a workout by ID.
   * @param id - The ID of the workout to retrieve.
   * @returns The found Workout.
   */
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<Workout> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter workouts based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of Workout entries matching the criteria.
   */
  @Post('filter')
  filter(@Body() filter: WorkoutFilter): Promise<Workout[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all workouts.
   * @returns A list of all Workout entries.
   */
  @Get('list')
  getAll(): Promise<Workout[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing workout.
   * @param payload - Data for updating the workout.
   * @returns The updated Workout.
   */
  @Put('update')
  update(@Body() payload: WorkoutUpdatePayload): Promise<Workout> {
    return this.service.update(payload);
  }
}
