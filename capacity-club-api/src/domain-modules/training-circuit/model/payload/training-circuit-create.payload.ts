import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional } from 'class-validator';
import { ExerciseTraining } from 'domain-modules/exercise-training/model';

export class TrainingCircuitCreatePayload {
  @ApiProperty()
  @IsString()
  @Length(1, 50)
  title: string;
  @ApiProperty()
  @IsOptional()
  exercise_training_list: ExerciseTraining[];
}
