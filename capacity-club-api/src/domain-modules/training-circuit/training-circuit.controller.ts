import { CrudController } from '@domain-modules-shared';
import {
  Controller,
  Post,
  Body,
  Delete,
  Param,
  Get,
  Put,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import {
  TrainingCircuit,
  TrainingCircuitCreatePayload,
  TrainingCircuitUpdatePayload,
} from './model';
import { TrainingCircuitService } from './training-circuit.service';
import { TrainingCircuitFilter } from './model/filter';

@ApiBearerAuth('access-token')
@ApiTags('Training Circuit')
@Controller('training-circuit')
export class TrainingCircuitController
  implements
    CrudController<
      TrainingCircuit,
      TrainingCircuitCreatePayload,
      TrainingCircuitUpdatePayload,
      TrainingCircuitFilter,
      string
    >
{
  constructor(private readonly service: TrainingCircuitService) {}

  @Post('create')
  create(
    @Body() payload: TrainingCircuitCreatePayload,
  ): Promise<TrainingCircuit> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<TrainingCircuit> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: TrainingCircuitFilter): Promise<TrainingCircuit[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<TrainingCircuit[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(
    @Body() payload: TrainingCircuitUpdatePayload,
  ): Promise<TrainingCircuit> {
    return this.service.update(payload);
  }
}
