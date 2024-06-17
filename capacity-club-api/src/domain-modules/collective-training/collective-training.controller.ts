import { CrudController } from '@domain-modules-shared';
import { Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import {
  CollectiveTraining,
  CollectiveTrainingCreatePayload,
  CollectiveTrainingUpdatePayload,
} from './model';
import { CollectiveTrainingService } from './collective-training.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { CollectiveTrainingFilter } from './model/filter';

ApiBearerAuth('access-token');
@ApiTags('Collective Training Session')
@Controller('collective-training-session')
export class CollectiveTrainingController
  implements
    CrudController<
      CollectiveTraining,
      CollectiveTrainingCreatePayload,
      CollectiveTrainingUpdatePayload,
      CollectiveTrainingFilter,
      string
    >
{
  constructor(private readonly service: CollectiveTrainingService) {}

  @Get('list')
  getAll(): Promise<CollectiveTraining[]> {
    return this.service.getAll();
  }
  @Post('filter')
  filter(filter: CollectiveTrainingFilter): Promise<CollectiveTraining[]> {
    return this.service.filter(filter);
  }
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<CollectiveTraining> {
    return this.service.detail(id);
  }
  @Post('create')
  create(
    payload: CollectiveTrainingCreatePayload,
  ): Promise<CollectiveTraining> {
    return this.service.create(payload);
  }
  @Put('update')
  update(
    payload: CollectiveTrainingUpdatePayload,
  ): Promise<CollectiveTraining> {
    return this.service.update(payload);
  }
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }
}
