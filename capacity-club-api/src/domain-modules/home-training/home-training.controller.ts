import {
  HomeTrainingControllerList,
  HomeTrainingControllerFilter,
  HomeTrainingControllerDetail,
  HomeTrainingControllerCreate,
  HomeTrainingControllerUpdate,
  HomeTrainingControllerDelete,
} from './../../common/documentation/swagger.annotations';
import { CrudController } from '@domain-modules-shared';
import { Controller, Delete, Get, Post, Put } from '@nestjs/common';
import { HomeTrainingFilter } from './model/filter/home-training.filter';
import { HomeTrainingService } from './home-training.service';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { HomeTraining } from './model/entity/home-training.entity';
import { HomeTrainingCreatePayload } from './model/payload/home-training-create.payload';
import { HomeTrainingUpdatePayload } from './model/payload/home-training-update.payload';

/**
 * Controller for managing home training programs.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating home training programs.
 */
@ApiBearerAuth('access-token')
@ApiTags('Home Training')
@Controller('home-training')
export class HomeTrainingController
  implements
    CrudController<
      HomeTraining,
      HomeTrainingCreatePayload,
      HomeTrainingUpdatePayload,
      HomeTrainingFilter,
      string
    >
{
  constructor(private readonly service: HomeTrainingService) {}

  /**
   * Endpoint to retrieve all home training programs.
   * @returns A list of all HomeTraining entries.
   */
  @Get('list')
  @ApiOperation(HomeTrainingControllerList)
  getAll(): Promise<HomeTraining[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to filter home training programs based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of HomeTraining entries matching the criteria.
   */
  @ApiOperation(HomeTrainingControllerFilter)
  @Post('filter')
  filter(filter: HomeTrainingFilter): Promise<HomeTraining[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve the details of a home training program by ID.
   * @param id - The ID of the home training program to retrieve.
   * @returns The found HomeTraining.
   */
  @ApiOperation(HomeTrainingControllerDetail)
  @Get('detail/:id')
  detail(id: string): Promise<HomeTraining> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to create a new home training program.
   * @param payload - Data for creating a new home training program.
   * @returns The created HomeTraining.
   */
  @ApiOperation(HomeTrainingControllerCreate)
  @Post('create')
  create(payload: HomeTrainingCreatePayload): Promise<HomeTraining> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to update an existing home training program.
   * @param payload - Data for updating the home training program.
   * @returns The updated HomeTraining.
   */
  @ApiOperation(HomeTrainingControllerUpdate)
  @Put('update')
  update(payload: HomeTrainingUpdatePayload): Promise<HomeTraining> {
    return this.service.update(payload);
  }

  /**
   * Endpoint to delete a home training program by ID.
   * @param id - The ID of the home training program to delete.
   */
  @ApiOperation(HomeTrainingControllerDelete)
  @Delete('delete/:id')
  delete(id: string): Promise<void> {
    return this.service.delete(id);
  }
}
