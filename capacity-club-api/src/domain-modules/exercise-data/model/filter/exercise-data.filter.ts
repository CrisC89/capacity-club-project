import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { ExerciseDataCategory } from '../enum';

export class ExerciseDataFilter {
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
