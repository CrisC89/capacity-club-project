import { CrudController } from '@domain-modules-shared';
import {
  Controller,
  Post,
  Body,
  Delete,
  Param,
  Get,
  Put,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { TrainingCircuit } from './model/entity/training-circuit.entity';
import { TrainingCircuitFilter } from './model/filter/training-circuit.filter';
import { TrainingCircuitCreatePayload } from './model/payload/training-circuit-create.payload';
import { TrainingCircuitUpdatePayload } from './model/payload/training-circuit-update.payload';
import { TrainingCircuitService } from './training-circuit.service';

/**
 * Controller for managing training circuits.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating training circuits.
 */
@ApiBearerAuth('access-token')
@ApiTags('Training Circuit')
@Controller('training-circuit')
export class TrainingCircuitController
  implements
    CrudController<
      TrainingCircuit,
      TrainingCircuitCreatePayload,
      TrainingCircuitUpdatePayload,
      TrainingCircuitFilter,
      string
    >
{
  constructor(private readonly service: TrainingCircuitService) {}

  /**
   * Endpoint to create a new training circuit.
   * @param payload - Data for creating a new training circuit.
   * @returns The created TrainingCircuit.
   */
  @Post('create')
  create(
    @Body() payload: TrainingCircuitCreatePayload,
  ): Promise<TrainingCircuit> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to delete a training circuit by ID.
   * @param id - The ID of the training circuit to delete.
   */
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of a training circuit by ID.
   * @param id - The ID of the training circuit to retrieve.
   * @returns The found TrainingCircuit.
   */
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<TrainingCircuit> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter training circuits based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of TrainingCircuit entries matching the criteria.
   */
  @Post('filter')
  filter(@Body() filter: TrainingCircuitFilter): Promise<TrainingCircuit[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all training circuits.
   * @returns A list of all TrainingCircuit entries.
   */
  @Get('list')
  getAll(): Promise<TrainingCircuit[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing training circuit.
   * @param payload - Data for updating the training circuit.
   * @returns The updated TrainingCircuit.
   */
  @Put('update')
  update(
    @Body() payload: TrainingCircuitUpdatePayload,
  ): Promise<TrainingCircuit> {
    return this.service.update(payload);
  }
}
