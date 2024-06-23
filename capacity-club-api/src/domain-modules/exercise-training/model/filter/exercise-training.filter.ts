import { ApiProperty } from '@nestjs/swagger';
import { IsOptional } from 'class-validator';
import { ExerciseData } from 'domain-modules/exercise-data/model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';

/**
 * Class used to filter exercise training.
 * This class defines the criteria used to filter a list of exercises training.
 */
export class ExerciseTrainingFilter {
  @ApiProperty()
  @IsOptional()
  exercise_data: ExerciseData;

  @ApiProperty()
  @IsOptional()
  training_circuit: TrainingCircuit;
}
