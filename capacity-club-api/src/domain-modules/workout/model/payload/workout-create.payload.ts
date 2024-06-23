import { ApiHideProperty, ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional } from 'class-validator';
import { CollectiveTraining } from '@common/collective-training/model/entity/collective-training.entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';

export class WorkoutCreatePayload {
  @ApiProperty()
  @IsString()
  @Length(1, 50)
  title: string;
  @ApiProperty()
  @IsOptional()
  training_circuits: TrainingCircuit[];
  @ApiHideProperty()
  @IsOptional()
  collective_training: CollectiveTraining;
}
