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
import { ExerciseDataService } from './exercise-data.service';
import {
  ExerciseData,
  ExerciseDataCreatePayload,
  ExerciseDataUpdatePayload,
} from './model';
import { ExerciseDataFilter } from './model/filter';
import {
  ExerciseDataControllerCreate,
  ExerciseDataControllerDelete,
  ExerciseDataControllerDetail,
  ExerciseDataControllerFilter,
  ExerciseDataControllerList,
  ExerciseDataControllerUpdate,
} from '@common/documentation';

/**
 * Controller for managing exercise data.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating exercise data.
 */

@ApiBearerAuth('access-token')
@ApiTags('Exercise Data')
@Controller('exercise-data')
export class ExerciseDataController
  implements
    CrudController<
      ExerciseData,
      ExerciseDataCreatePayload,
      ExerciseDataUpdatePayload,
      ExerciseDataFilter,
      string
    >
{
  constructor(private readonly service: ExerciseDataService) {}
  /**
   * Endpoint to create a new exercise data entry.
   * @param payload - Data for creating a new exercise.
   * @returns The created ExerciseData.
   */
  @ApiOperation(ExerciseDataControllerCreate)
  @Post('create')
  create(@Body() payload: ExerciseDataCreatePayload): Promise<ExerciseData> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to delete an exercise data entry by ID.
   * @param id - The ID of the exercise data to delete.
   */
  @ApiOperation(ExerciseDataControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of an exercise data entry by ID.
   * @param id - The ID of the exercise data to retrieve.
   * @returns The found ExerciseData.
   */
  @ApiOperation(ExerciseDataControllerDetail)
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<ExerciseData> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter exercise data based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of ExerciseData entries matching the criteria.
   */
  @ApiOperation(ExerciseDataControllerFilter)
  @Post('filter')
  filter(@Body() filter: ExerciseDataFilter): Promise<ExerciseData[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all exercise data entries.
   * @returns A list of all ExerciseData entries.
   */
  @ApiOperation(ExerciseDataControllerList)
  @Get('list')
  getAll(): Promise<ExerciseData[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing exercise data entry.
   * @param payload - Data for updating the exercise.
   * @returns The updated ExerciseData.
   */
  @ApiOperation(ExerciseDataControllerUpdate)
  @Put('update')
  update(@Body() payload: ExerciseDataUpdatePayload): Promise<ExerciseData> {
    return this.service.update(payload);
  }
}
