import { UniqueId } from '@common/model';
import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsNotEmpty, Length } from 'class-validator';
import { ExerciseData } from 'domain-modules/exercise-data/model/entity/exercise-data.entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { TrainingIntensity } from '../enum/training_intensity.enum';

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
  @IsNotEmpty()
  nb_reps: number;

  @ApiProperty()
  @IsNotEmpty()
  intensity: string;

  @ApiProperty()
  @IsNotEmpty()
  @IsEnum(TrainingIntensity)
  intensityType: TrainingIntensity;

  @ApiProperty({ type: () => ExerciseData })
  exercise_data: ExerciseData;

  @ApiProperty({ type: () => TrainingCircuit })
  training_circuit: TrainingCircuit;
}
