import { CrudController, Filter } from '@domain-modules-shared';
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
import { MemberSubscriptionService } from './member-subscription.service';
import {
  MemberSubscription,
  MemberSubscriptionCreatePayload,
  MemberSubscriptionUpdatePayload,
} from './model';

@ApiBearerAuth('access-token')
@ApiTags('Souscription des membres')
@Controller('member-subscription')
export class MemberSubscriptionController
  implements
    CrudController<
      MemberSubscription,
      MemberSubscriptionCreatePayload,
      MemberSubscriptionUpdatePayload,
      string
    >
{
  constructor(private readonly service: MemberSubscriptionService) {}

  @Post('create')
  create(
    @Body() payload: MemberSubscriptionCreatePayload,
  ): Promise<MemberSubscription> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<MemberSubscription> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: Filter): Promise<MemberSubscription[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<MemberSubscription[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(
    @Body() payload: MemberSubscriptionUpdatePayload,
  ): Promise<MemberSubscription> {
    return this.service.update(payload);
  }
}
