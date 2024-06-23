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
import { MemberPlan } from './model/entity/member-plan.entity';
import { CrudController } from 'domain-modules/shared/model/interface/crud-controller.interface';
import { MemberPlanCreatePayload } from './model/payload/member-plan-create.payload';
import { MemberPlanUpdatePayload } from './model/payload/member-plan-update.payload';
import { MemberPlanService } from './member-plan.service';
import { MemberPlanFilter } from './model/filter';

/**
 * Controller for managing member plans.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating member plans.
 */
@ApiBearerAuth('access-token')
@ApiTags('Abonnement membre')
@Controller('member-plan')
export class MemberPlanController
  implements
    CrudController<
      MemberPlan,
      MemberPlanCreatePayload,
      MemberPlanUpdatePayload,
      MemberPlanFilter,
      string
    >
{
  constructor(private readonly service: MemberPlanService) {}

  /**
   * Endpoint to create a new member plan.
   * @param payload - Data for creating a new member plan.
   * @returns The created MemberPlan.
   */
  @Post('create')
  create(@Body() payload: MemberPlanCreatePayload): Promise<MemberPlan> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to delete a member plan by ID.
   * @param id - The ID of the member plan to delete.
   */
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of a member plan by ID.
   * @param id - The ID of the member plan to retrieve.
   * @returns The found MemberPlan.
   */
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<MemberPlan> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter member plans based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberPlan entries matching the criteria.
   */
  @Post('filter')
  filter(@Body() filter: MemberPlanFilter): Promise<MemberPlan[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all member plans.
   * @returns A list of all MemberPlan entries.
   */
  @Get('list')
  getAll(): Promise<MemberPlan[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing member plan.
   * @param payload - Data for updating the member plan.
   * @returns The updated MemberPlan.
   */
  @Put('update')
  update(@Body() payload: MemberPlanUpdatePayload): Promise<MemberPlan> {
    return this.service.update(payload);
  }
}
