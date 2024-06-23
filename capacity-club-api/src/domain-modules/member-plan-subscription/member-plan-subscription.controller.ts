import { CrudController } from '@domain-modules-shared';
import { Controller, Delete, Get, Post, Put } from '@nestjs/common';
import {
  MemberPlanSubscription,
  MemberPlanSubscriptionCreatePayload,
  MemberPlanSubscriptionUpdatePayload,
} from './model';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { MemberPlanSubscriptionService } from './member-plan-subscription.service';
import { MemberPlanSubscriptionFilter } from './model/filter';

/**
 * Controller for managing member plan subscriptions.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating member plan subscriptions.
 */
@ApiBearerAuth('access-token')
@ApiTags('Souscription des membres')
@Controller('member-plan-subscription')
export class MemberPlanSubscriptionController
  implements
    CrudController<
      MemberPlanSubscription,
      MemberPlanSubscriptionCreatePayload,
      MemberPlanSubscriptionUpdatePayload,
      MemberPlanSubscriptionFilter,
      string
    >
{
  constructor(private readonly service: MemberPlanSubscriptionService) {}

  /**
   * Endpoint to retrieve all member plan subscriptions.
   * @returns A list of all MemberPlanSubscription entries.
   */
  @Get('list')
  getAll(): Promise<MemberPlanSubscription[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to filter member plan subscriptions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberPlanSubscription entries matching the criteria.
   */
  @Post('filter')
  filter(
    filter: MemberPlanSubscriptionFilter,
  ): Promise<MemberPlanSubscription[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve the details of a member plan subscription by ID.
   * @param id - The ID of the member plan subscription to retrieve.
   * @returns The found MemberPlanSubscription.
   */
  @Get('detail/:id')
  detail(id: string): Promise<MemberPlanSubscription> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to create a new member plan subscription.
   * @param payload - Data for creating a new member plan subscription.
   * @returns The created MemberPlanSubscription.
   */
  @Post('create')
  create(
    payload: MemberPlanSubscriptionCreatePayload,
  ): Promise<MemberPlanSubscription> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to update an existing member plan subscription.
   * @param payload - Data for updating the subscription.
   * @returns The updated MemberPlanSubscription.
   */
  @Put('update')
  update(
    payload: MemberPlanSubscriptionUpdatePayload,
  ): Promise<MemberPlanSubscription> {
    return this.service.update(payload);
  }

  /**
   * Endpoint to delete a member plan subscription by ID.
   * @param id - The ID of the subscription to delete.
   */
  @Delete('delete/:id')
  delete(id: string): Promise<void> {
    return this.service.delete(id);
  }
}
