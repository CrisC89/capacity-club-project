import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, Length } from 'class-validator';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { TrainingIntensity } from '../enum';
import { ExerciseData } from 'domain-modules/exercise-data/model';

export class ExerciseTrainingCreatePayload {
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
