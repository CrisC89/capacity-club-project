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
import {
  IndoorTraining,
  IndoorTrainingCreatePayload,
  IndoorTrainingUpdatePayload,
  IndoorTrainingFilter,
} from './model';
import { IndoorTrainingService } from './indoor-training.service';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import {
  HomeTrainingControllerCreate,
  HomeTrainingControllerDelete,
  HomeTrainingControllerDetail,
  HomeTrainingControllerList,
  HomeTrainingControllerUpdate,
  IndoorTrainingControllerFilter,
} from '@common/documentation';

/**
 * Controller for managing indoor training sessions.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating indoor training sessions.
 */
@ApiBearerAuth('access-token')
@ApiTags('Indoor Training')
@Controller('indoor-training')
export class IndoorTrainingController
  implements
    CrudController<
      IndoorTraining,
      IndoorTrainingCreatePayload,
      IndoorTrainingUpdatePayload,
      IndoorTrainingFilter,
      string
    >
{
  constructor(private readonly service: IndoorTrainingService) {}
  /**
   * Endpoint to retrieve all indoor training sessions.
   * @returns A list of all IndoorTraining entries.
   */
  @ApiOperation(HomeTrainingControllerList)
  @Get('list')
  getAll(): Promise<IndoorTraining[]> {
    return this.service.getAll();
  }
  /**
   * Endpoint to filter indoor training sessions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of IndoorTraining entries matching the criteria.
   */
  @ApiOperation(IndoorTrainingControllerFilter)
  @Post('filter')
  filter(filter: IndoorTrainingFilter): Promise<IndoorTraining[]> {
    return this.service.filter(filter);
  }
  /**
   * Endpoint to retrieve the details of an indoor training session by ID.
   * @param id - The ID of the indoor training session to retrieve.
   * @returns The found IndoorTraining.
   */
  @ApiOperation(HomeTrainingControllerDetail)
  detail(@Param('id') id: string): Promise<IndoorTraining> {
    return this.service.detail(id);
  }
  /**
   * Endpoint to create a new indoor training session.
   * @param payload - Data for creating a new indoor training session.
   * @returns The created IndoorTraining.
   */
  @ApiOperation(HomeTrainingControllerCreate)
  @Post('create')
  create(
    @Body() payload: IndoorTrainingCreatePayload,
  ): Promise<IndoorTraining> {
    return this.service.create(payload);
  }
  /**
   * Endpoint to update an existing indoor training session.
   * @param payload - Data for updating the session.
   * @returns The updated IndoorTraining.
   */
  @ApiOperation(HomeTrainingControllerUpdate)
  @Put('update')
  update(
    @Body() payload: IndoorTrainingUpdatePayload,
  ): Promise<IndoorTraining> {
    return this.service.update(payload);
  }
  /**
   * Endpoint to delete an indoor training session by ID.
   * @param id - The ID of the session to delete.
   */
  @ApiOperation(HomeTrainingControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }
}
