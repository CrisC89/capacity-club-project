import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional } from 'class-validator';
import { ExerciseDataCategory } from '../enum';

/**
 * Class used to filter exercise data.
 * This class defines the criteria used to filter a list of exercises data.
 */
export class ExerciseDataFilter {
  @ApiProperty()
  @IsOptional()
  title: string;
  @ApiProperty()
  @IsOptional()
  categories: ExerciseDataCategory[];
}
