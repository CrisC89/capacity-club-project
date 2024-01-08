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
import { Filter } from 'domain-modules/shared/model/interface/filter.interface';

@ApiBearerAuth('access-token')
@ApiTags('Abonnement membre')
@Controller('member-plan')
export class MemberPlanController
  implements
    CrudController<
      MemberPlan,
      MemberPlanCreatePayload,
      MemberPlanUpdatePayload,
      string
    >
{
  constructor(private readonly service: MemberPlanService) {}

  @Post('create')
  create(@Body() payload: MemberPlanCreatePayload): Promise<MemberPlan> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<MemberPlan> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: Filter): Promise<MemberPlan[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<MemberPlan[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(@Body() payload: MemberPlanUpdatePayload): Promise<MemberPlan> {
    return this.service.update(payload);
  }
}
