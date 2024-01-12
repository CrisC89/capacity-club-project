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
import { ExerciseDataService } from './exercise-data.service';
import {
  ExerciseData,
  ExerciseDataCreatePayload,
  ExerciseDataUpdatePayload,
} from './model';

@ApiBearerAuth('access-token')
@ApiTags('Exercise Data')
@Controller('exercise-data')
export class ExerciseDataController
  implements
    CrudController<
      ExerciseData,
      ExerciseDataCreatePayload,
      ExerciseDataUpdatePayload,
      string
    >
{
  constructor(private readonly service: ExerciseDataService) {}
  @Post('create')
  create(@Body() payload: ExerciseDataCreatePayload): Promise<ExerciseData> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<ExerciseData> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: Filter): Promise<ExerciseData[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<ExerciseData[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(@Body() payload: ExerciseDataUpdatePayload): Promise<ExerciseData> {
    return this.service.update(payload);
  }
}
