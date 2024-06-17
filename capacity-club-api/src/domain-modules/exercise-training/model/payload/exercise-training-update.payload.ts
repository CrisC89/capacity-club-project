import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsNotEmpty, Length } from 'class-validator';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { TrainingIntensity } from '../enum';
import { UniqueId } from '@common/model/unique-id';
import { ExerciseData } from 'domain-modules/exercise-data/model';

export class ExerciseTrainingUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  exercise_training_id: UniqueId;

  @ApiProperty()
  @Length(1, 50)
  nb_reps: number;

  @ApiProperty()
  @IsEnum(TrainingIntensity)
  intensity: TrainingIntensity;

  @ApiProperty()
  member_feedback: number;

  @ApiProperty()
  exercise_data: ExerciseData;

  @ApiProperty()
  training_circuit: TrainingCircuit;
}
