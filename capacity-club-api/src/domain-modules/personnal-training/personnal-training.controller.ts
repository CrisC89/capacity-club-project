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
import {
  PersonnalTraining,
  PersonnalTrainingCreatePayload,
  PersonnalTrainingUpdatePayload,
} from './model';
import { PersonnalTrainingService } from './personnal-training.service';

@ApiBearerAuth('access-token')
@ApiTags('Entrainement personnel')
@Controller('personnal-training')
export class PersonnalTrainingController
  implements
    CrudController<
      PersonnalTraining,
      PersonnalTrainingCreatePayload,
      PersonnalTrainingUpdatePayload,
      string
    >
{
  constructor(private readonly service: PersonnalTrainingService) {}

  @Post('create')
  create(
    @Body() payload: PersonnalTrainingCreatePayload,
  ): Promise<PersonnalTraining> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<PersonnalTraining> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: Filter): Promise<PersonnalTraining[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<PersonnalTraining[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(
    @Body() payload: PersonnalTrainingUpdatePayload,
  ): Promise<PersonnalTraining> {
    return this.service.update(payload);
  }
}
