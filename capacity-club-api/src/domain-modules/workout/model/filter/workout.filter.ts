import { ApiProperty, ApiHideProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional } from 'class-validator';
import { CollectiveTraining } from '@common/collective-training/model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';

export class WorkoutFilter {
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
