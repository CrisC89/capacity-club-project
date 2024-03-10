import { CrudController } from '@domain-modules-shared';
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
import { ExerciseTrainingService } from './exercise-training.service';
import {
  ExerciseTraining,
  ExerciseTrainingCreatePayload,
  ExerciseTrainingUpdatePayload,
} from './model';
import { ExerciseTrainingFilter } from './model/filter';

@ApiBearerAuth('access-token')
@ApiTags('Exercise Training')
@Controller('exercise-training')
export class ExerciseTrainingController
  implements
    CrudController<
      ExerciseTraining,
      ExerciseTrainingCreatePayload,
      ExerciseTrainingUpdatePayload,
      ExerciseTrainingFilter,
      string
    >
{
  constructor(private readonly service: ExerciseTrainingService) {}
  @Post('create')
  create(
    @Body() payload: ExerciseTrainingCreatePayload,
  ): Promise<ExerciseTraining> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<ExerciseTraining> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: ExerciseTrainingFilter): Promise<ExerciseTraining[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<ExerciseTraining[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(
    @Body() payload: ExerciseTrainingUpdatePayload,
  ): Promise<ExerciseTraining> {
    return this.service.update(payload);
  }
}
