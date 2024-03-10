import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsEnum } from 'class-validator';
import { TrainingIntensity } from '../enum';

export class ExerciseTrainingFilter {
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
}
