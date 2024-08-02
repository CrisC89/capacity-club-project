import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional, IsNotEmpty } from 'class-validator';
import { HomeTraining } from 'domain-modules/home-training/model/entity/home-training.entity';
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity/indoor-training.entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';

/**
 * Class used to create workout.
 * This class defines the payload used when creating new workout.
 */
export class WorkoutCreatePayload {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @Length(1, 50)
  title: string;
  @ApiProperty({ type: () => TrainingCircuit, isArray: true })
  @IsOptional()
  training_circuits: TrainingCircuit[];
  @ApiProperty({ type: () => HomeTraining })
  @IsOptional()
  home_training: HomeTraining;
  @ApiProperty({ type: () => IndoorTraining })
  @IsOptional()
  indoor_training: IndoorTraining;
}
