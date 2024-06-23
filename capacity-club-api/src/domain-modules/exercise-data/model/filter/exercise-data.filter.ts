import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { ExerciseDataCategory } from '../enum';

/**
 * Class used to filter exercise data.
 * This class defines the criteria used to filter a list of exercises data.
 */
export class ExerciseDataFilter {
  @ApiProperty()
  @IsNotEmpty()
  title: string;
  @ApiProperty()
  @IsNotEmpty()
  categories: ExerciseDataCategory[];
}
