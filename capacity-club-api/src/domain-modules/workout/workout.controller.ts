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
import { Workout, WorkoutCreatePayload, WorkoutUpdatePayload } from './model';
import { CrudController } from '@domain-modules-shared';
import { WorkoutService } from './workout.service';
import { WorkoutFilter } from './model/filter';

@ApiBearerAuth('access-token')
@ApiTags('Workout')
@Controller('workout')
export class WorkoutController
  implements
    CrudController<
      Workout,
      WorkoutCreatePayload,
      WorkoutUpdatePayload,
      WorkoutFilter,
      string
    >
{
  constructor(private readonly service: WorkoutService) {}

  @Post('create')
  create(@Body() payload: WorkoutCreatePayload): Promise<Workout> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<Workout> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: WorkoutFilter): Promise<Workout[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<Workout[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(@Body() payload: WorkoutUpdatePayload): Promise<Workout> {
    return this.service.update(payload);
  }
}
