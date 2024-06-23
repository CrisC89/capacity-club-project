import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsNotEmpty, IsOptional, Length } from 'class-validator';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { TrainingIntensity } from '../enum';
import { UniqueId } from '@common/model/unique-id';
import { ExerciseData } from 'domain-modules/exercise-data/model';

/**
 * Class used to update exercise training.
 * This class defines the payload used when updating existing exercise training.
 */
export class ExerciseTrainingUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  exercise_training_id: UniqueId;

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
