import { ApiProperty } from '@nestjs/swagger';
import { Length, IsEnum } from 'class-validator';
import { TrainingIntensity } from '../enum';
import { ExerciseData } from 'domain-modules/exercise-data/model';

export class ExerciseTrainingFilter {
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
}
