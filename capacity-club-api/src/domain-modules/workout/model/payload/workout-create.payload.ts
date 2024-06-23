import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional } from 'class-validator';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';
import { HomeTraining } from 'domain-modules/home-training/model/entity';
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity';

/**
 * Class used to create workout.
 * This class defines the payload used when creating new workout.
 */
export class WorkoutCreatePayload {
  @ApiProperty()
  @IsString()
  @Length(1, 50)
  title: string;
  @ApiProperty()
  @IsOptional()
  training_circuits: TrainingCircuit[];
  @ApiProperty()
  @IsOptional()
  home_training: HomeTraining;
  @ApiProperty()
  @IsOptional()
  indoor_training: IndoorTraining;
}
