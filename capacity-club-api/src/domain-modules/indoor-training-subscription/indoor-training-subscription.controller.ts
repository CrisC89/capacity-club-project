import {
  Body,
  Controller,
  Delete,
  Get,
  Logger,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { CrudController } from '@domain-modules-shared';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { IndoorTrainingSubscriptionService } from './indoor-training-subscription.service';
import { IndoorTrainingSubscriptionControllerFilter } from '@common/documentation';
import { IndoorTrainingSubscription } from './model/entity/indoor-training-subscription.entity';
import { IndoorTrainingSubscriptionFilter } from './model/filter/indoor-training-subscription.filter';
import { IndoorTrainingSubscriptionCreatePayload } from './model/payload/indoor-training-subscription-create.payload';
import { IndoorTrainingSubscriptionUpdatePayload } from './model/payload/indoor-training-subscription-update.payload';

/**
 * Controller for managing indoor training sessions.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating indoor training sessions.
 */
@ApiBearerAuth('access-token')
@ApiTags('Indoor Training Subscription')
@Controller('indoor-training-subscription')
export class IndoorTrainingSubscriptionController
  implements
    CrudController<
      IndoorTrainingSubscription,
      IndoorTrainingSubscriptionCreatePayload,
      IndoorTrainingSubscriptionUpdatePayload,
      IndoorTrainingSubscriptionFilter,
      string
    >
{
  constructor(private readonly service: IndoorTrainingSubscriptionService) {}
  private readonly logger = new Logger(
    IndoorTrainingSubscriptionController.name,
  );
  /**
   * Endpoint to retrieve all indoor training sessions.
   * @returns A list of all IndoorTraining entries.
   */
  @ApiOperation(IndoorTrainingSubscriptionControllerFilter)
  @Get('list')
  getAll(): Promise<IndoorTrainingSubscription[]> {
    return this.service.getAll();
  }
  /**
   * Endpoint to filter indoor training sessions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of IndoorTraining entries matching the criteria.
   */
  @ApiOperation(IndoorTrainingSubscriptionControllerFilter)
  @Post('filter')
  filter(
    @Body() filter: IndoorTrainingSubscriptionFilter,
  ): Promise<IndoorTrainingSubscription[]> {
    this.logger.log('Indoor filter endpoint called');
    return this.service.filter(filter);
  }
  /**
   * Endpoint to retrieve the details of an indoor training session by ID.
   * @param id - The ID of the indoor training session to retrieve.
   * @returns The found IndoorTraining.
   */
  @ApiOperation(IndoorTrainingSubscriptionControllerFilter)
  detail(@Param('id') id: string): Promise<IndoorTrainingSubscription> {
    return this.service.detail(id);
  }
  /**
   * Endpoint to create a new indoor training session.
   * @param payload - Data for creating a new indoor training session.
   * @returns The created IndoorTraining.
   */
  @ApiOperation(IndoorTrainingSubscriptionControllerFilter)
  @Post('create')
  create(
    @Body() payload: IndoorTrainingSubscriptionCreatePayload,
  ): Promise<IndoorTrainingSubscription> {
    return this.service.create(payload);
  }
  /**
   * Endpoint to update an existing indoor training session.
   * @param payload - Data for updating the session.
   * @returns The updated IndoorTraining.
   */
  @ApiOperation(IndoorTrainingSubscriptionControllerFilter)
  @Put('update')
  update(
    @Body() payload: IndoorTrainingSubscriptionUpdatePayload,
  ): Promise<IndoorTrainingSubscription> {
    return this.service.update(payload);
  }
  /**
   * Endpoint to delete an indoor training session by ID.
   * @param id - The ID of the session to delete.
   */
  @ApiOperation(IndoorTrainingSubscriptionControllerFilter)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }
}
