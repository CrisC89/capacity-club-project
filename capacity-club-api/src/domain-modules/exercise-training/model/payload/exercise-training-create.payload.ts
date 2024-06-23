import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsOptional, Length } from 'class-validator';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { TrainingIntensity } from '../enum';
import { ExerciseData } from 'domain-modules/exercise-data/model';

/**
 * Class used to create exercise training.
 * This class defines the payload used when creating new exercise training.
 */
export class ExerciseTrainingCreatePayload {
  @ApiProperty()
  @Length(1, 50)
  nb_reps: number;

  @ApiProperty()
  @IsOptional()
  intensity: string;

  @ApiProperty()
  @IsEnum(TrainingIntensity)
  intensityType: TrainingIntensity;

  @ApiProperty()
  exercise_data: ExerciseData;

  @ApiProperty()
  training_circuit: TrainingCircuit;
}
