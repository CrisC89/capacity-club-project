import { ApiProperty } from '@nestjs/swagger';
import { IsOptional } from 'class-validator';
import { Workout } from 'domain-modules/workout/model';

/**
 * Class used to filter indoor training.
 * This class defines the criteria used to filter a list of indoor training.
 */
export class IndoorTrainingFilter {
  @ApiProperty()
  @IsOptional()
  title: string;
  @ApiProperty()
  @IsOptional()
  training_date: Date;
  @ApiProperty()
  @IsOptional()
  start_hours: string;
  @ApiProperty()
  @IsOptional()
  end_hours: string;
  @ApiProperty()
  @IsOptional()
  nb_place: number;
  @ApiProperty()
  @IsOptional()
  nb_subscription: number;
  @ApiProperty()
  @IsOptional()
  workout: Workout;
}
