import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsNotEmpty, IsOptional, Length } from 'class-validator';
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
  @IsNotEmpty()
  nb_reps: number;

  @ApiProperty()
  @IsNotEmpty()
  intensity: string;

  @ApiProperty()
  @IsEnum(TrainingIntensity)
  @IsNotEmpty()
  intensityType: TrainingIntensity;

  @ApiProperty({ type: () => ExerciseData })
  exercise_data: ExerciseData;

  @ApiProperty({ type: () => TrainingCircuit })
  training_circuit: TrainingCircuit;
}
