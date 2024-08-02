import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional } from 'class-validator';
import { ExerciseDataCategory } from '../enum/exercise-data-category.enum';
import { exerciseDataProperties } from '@common/documentation';
import { ApiCodeResponse } from '@common/api';
import { ExerciseTraining } from 'domain-modules/exercise-training/model/entity/exercise-training.entity';

/**
 * Class used to create exercise data.
 * This class defines the payload used when creating new exercise data.
 */
export class ExerciseDataCreatePayload {
  @ApiProperty({
    name: exerciseDataProperties.title.name,
    description: exerciseDataProperties.title.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.EXERCISE_DATA_TITLE_IS_MISSING,
  })
  title: string;

  @ApiProperty({
    name: exerciseDataProperties.description.name,
    description: exerciseDataProperties.description.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.EXERCISE_DATA_DESCRIPTION_IS_MISSING,
  })
  description: string[];
  @ApiProperty({
    name: exerciseDataProperties.categories.name,
    description: exerciseDataProperties.categories.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.EXERCISE_DATA_CATEGORIES_ARE_MISSING,
  })
  categories: ExerciseDataCategory[];
  @ApiProperty({
    name: exerciseDataProperties.video_youtube_link.name,
    description: exerciseDataProperties.video_youtube_link.description,
  })
  @IsOptional()
  video_youtube_link: string;
  @ApiProperty({
    name: exerciseDataProperties.video_asset_link.name,
    description: exerciseDataProperties.video_asset_link.description,
  })
  @IsOptional()
  video_asset_link: string;
  @ApiProperty({
    name: exerciseDataProperties.exercise_training_list.name,
    description: exerciseDataProperties.exercise_training_list.description,
    type: () => ExerciseTraining,
    isArray: true,
  })
  @IsOptional()
  exercise_training_list: ExerciseTraining[];
}
