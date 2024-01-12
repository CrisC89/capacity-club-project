import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsNotEmpty, IsString, Length } from 'class-validator';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { TrainingIntensity } from '../enum';

export class ExerciseTrainingUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  exercise_training_id: string;

  @ApiProperty()
  @IsString()
  @Length(1, 50)
  title: string;

  @ApiProperty()
  @Length(1, 50)
  nb_reps: number;

  @ApiProperty()
  @IsEnum(TrainingIntensity)
  intensity: TrainingIntensity;

  @ApiProperty()
  member_feedback: number;

  @ApiProperty()
  @IsString()
  @Length(1, 1000)
  member_note: string;

  @ApiProperty()
  training_circuit: TrainingCircuit;
}
