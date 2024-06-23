import { CrudController } from '@domain-modules-shared';
import { Controller, Delete, Get, Post, Put } from '@nestjs/common';
import {
  HomeTrainingCreatePayload,
  HomeTrainingUpdatePayload,
} from './model/payload';
import { HomeTraining } from './model/entity';
import { HomeTrainingFilter } from './model/filter/home-training.filter';
import { HomeTrainingService } from './home-training.service';

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
  @Get('list')
  getAll(): Promise<HomeTraining[]> {
    return this.service.getAll();
  }
  @Post('filter')
  filter(filter: HomeTrainingFilter): Promise<HomeTraining[]> {
    return this.service.filter(filter);
  }
  @Get('detail/:id')
  detail(id: string): Promise<HomeTraining> {
    return this.service.detail(id);
  }
  @Post('create')
  create(payload: HomeTrainingCreatePayload): Promise<HomeTraining> {
    return this.service.create(payload);
  }
  @Put('update')
  update(payload: HomeTrainingUpdatePayload): Promise<HomeTraining> {
    return this.service.update(payload);
  }
  @Delete('delete/:id')
  delete(id: string): Promise<void> {
    return this.service.delete(id);
  }
}
