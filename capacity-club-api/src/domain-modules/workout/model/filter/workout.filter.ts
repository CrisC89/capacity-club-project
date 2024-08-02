import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional } from 'class-validator';
import { HomeTraining } from 'domain-modules/home-training/model/entity/home-training.entity';
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity/indoor-training.entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';

/**
 * Class used to filter workout.
 * This class defines the criteria used to filter a list of workout.
 */
export class WorkoutFilter {
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
