import { CrudController } from '@domain-modules-shared';
import { Controller, Delete, Get, Post, Put } from '@nestjs/common';
import {
  MemberPlanSubscription,
  MemberPlanSubscriptionCreatePayload,
  MemberPlanSubscriptionUpdatePayload,
} from './model';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { MemberPlanSubscriptionService } from './member-plan-subscription.service';

@ApiBearerAuth('access-token')
@ApiTags('Souscription des membres')
@Controller('member-plan-subscription')
export class MemberPlanSubscriptionController
  implements
    CrudController<
      MemberPlanSubscription,
      MemberPlanSubscriptionCreatePayload,
      MemberPlanSubscriptionUpdatePayload,
      MemberPlanSubscription,
      string
    >
{
  constructor(private readonly service: MemberPlanSubscriptionService) {}
  @Get('list')
  getAll(): Promise<MemberPlanSubscription[]> {
    return this.service.getAll();
  }
  @Post('filter')
  filter(filter: MemberPlanSubscription): Promise<MemberPlanSubscription[]> {
    return this.service.filter(filter);
  }
  @Get('detail/:id')
  detail(id: string): Promise<MemberPlanSubscription> {
    return this.service.detail(id);
  }
  @Post('create')
  create(
    payload: MemberPlanSubscriptionCreatePayload,
  ): Promise<MemberPlanSubscription> {
    return this.service.create(payload);
  }
  @Put('update')
  update(
    payload: MemberPlanSubscriptionUpdatePayload,
  ): Promise<MemberPlanSubscription> {
    return this.service.update(payload);
  }
  @Delete('delete/:id')
  delete(id: string): Promise<void> {
    return this.service.delete(id);
  }
}
