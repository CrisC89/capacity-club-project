import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { ExerciseDataCategory } from '../enum/exercise-data-category.enum';
import { ExerciseTraining } from 'domain-modules/exercise-training/model';

export class ExerciseDataCreatePayload {
  @ApiProperty()
  @IsNotEmpty()
  title: string;
  @ApiProperty()
  @IsNotEmpty()
  description: string[];
  @ApiProperty()
  @IsNotEmpty()
  categories: ExerciseDataCategory[];
  @ApiProperty()
  video_youtube_link: string;
  @ApiProperty()
  video_asset_link: string;
  @ApiProperty()
  exercise_training_list: ExerciseTraining[];
}
