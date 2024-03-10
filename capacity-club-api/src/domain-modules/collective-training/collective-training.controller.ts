import { CrudController } from '@domain-modules-shared';
import { Controller } from '@nestjs/common';
import { CollectiveTrainingUpdatePayload } from './model/payload/collective-training-update.payload';
import { CollectiveTraining } from './model/entity/collective-training.entity';
import { CollectiveTrainingCreatePayload } from './model';
import { CollectiveTrainingService } from './collective-training.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { CollectiveTrainingFilter } from './model/filter';

@ApiBearerAuth('access-token')
@ApiTags('Entrainement collectif')
@Controller('collective-training')
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
  constructor(private service: CollectiveTrainingService) {}

  getAll(): Promise<CollectiveTraining[]> {
    return this.service.getAll();
  }
  filter(filter: CollectiveTrainingFilter): Promise<CollectiveTraining[]> {
    return this.service.filter(filter);
  }
  detail(id: string): Promise<CollectiveTraining> {
    return this.service.detail(id);
  }
  create(
    payload: CollectiveTrainingCreatePayload,
  ): Promise<CollectiveTraining> {
    return this.service.create(payload);
  }
  update(
    payload: CollectiveTrainingUpdatePayload,
  ): Promise<CollectiveTraining> {
    return this.service.update(payload);
  }
  delete(id: string): Promise<void> {
    return this.service.delete(id);
  }
}
