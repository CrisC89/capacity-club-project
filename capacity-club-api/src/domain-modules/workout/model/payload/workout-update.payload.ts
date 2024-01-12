import { ApiHideProperty, ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length, IsString, IsOptional } from 'class-validator';
import { CollectiveTraining } from 'domain-modules/collective-training/model/entity/collective-training.entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';

export class WorkoutUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  workout_id: string;
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
