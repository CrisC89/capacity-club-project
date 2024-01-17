import { CrudController, Filter } from '@domain-modules-shared';
import { Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import {
  CollectiveTrainingSession,
  CollectiveTrainingSessionCreatePayload,
  CollectiveTrainingSessionUpdatePayload,
} from './model';
import { CollectiveTrainingSessionService } from './collective-training-session.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

ApiBearerAuth('access-token');
@ApiTags('Collective Training Session')
@Controller('collective-training-session')
export class CollectiveTrainingSessionController
  implements
    CrudController<
      CollectiveTrainingSession,
      CollectiveTrainingSessionCreatePayload,
      CollectiveTrainingSessionUpdatePayload,
      string
    >
{
  constructor(private readonly service: CollectiveTrainingSessionService) {}

  @Get('list')
  getAll(): Promise<CollectiveTrainingSession[]> {
    return this.service.getAll();
  }
  @Post('filter')
  filter(filter: Filter): Promise<CollectiveTrainingSession[]> {
    return this.service.filter(filter);
  }
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<CollectiveTrainingSession> {
    return this.service.detail(id);
  }
  @Post('create')
  create(
    payload: CollectiveTrainingSessionCreatePayload,
  ): Promise<CollectiveTrainingSession> {
    return this.service.create(payload);
  }
  @Put('update')
  update(
    payload: CollectiveTrainingSessionUpdatePayload,
  ): Promise<CollectiveTrainingSession> {
    return this.service.update(payload);
  }
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }
}
