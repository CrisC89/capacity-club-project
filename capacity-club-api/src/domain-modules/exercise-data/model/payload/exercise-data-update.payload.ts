import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { ExerciseDataCategory } from '../enum/exercise-data-category.enum';
import { UniqueId } from '@common/model/unique-id';

export class ExerciseDataUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  exercise_data_id: UniqueId;
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
  @IsNotEmpty()
  video_link: string;
}
