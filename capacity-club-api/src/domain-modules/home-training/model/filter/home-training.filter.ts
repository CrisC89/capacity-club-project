import { ApiProperty } from '@nestjs/swagger';
import { IsOptional } from 'class-validator';
import { Workout } from 'domain-modules/workout/model';

/**
 * Class used to filter home training.
 * This class defines the criteria used to filter a list of home training.
 */
export class HomeTrainingFilter {
  @ApiProperty()
  @IsOptional()
  title: string;
  @ApiProperty()
  @IsOptional()
  nb_week: number;
  @ApiProperty()
  @IsOptional()
  nb_training_by_week: number;
  @ApiProperty()
  @IsOptional()
  workouts: Workout[];
}
