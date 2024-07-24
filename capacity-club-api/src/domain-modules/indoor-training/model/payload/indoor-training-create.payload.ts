import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional } from 'class-validator';
import { Workout } from 'domain-modules/workout/model';

/**
 * Class used to create indoor training.
 * This class defines the payload used when creating new indoor training.
 */
export class IndoorTrainingCreatePayload implements Payload {
  @ApiProperty()
  @IsNotEmpty()
  title: string;
  @ApiProperty()
  @IsNotEmpty()
  training_date: Date;
  @ApiProperty()
  @IsNotEmpty()
  start_hours: string;
  @ApiProperty()
  @IsNotEmpty()
  end_hours: string;
  @ApiProperty()
  @IsNotEmpty()
  nb_place: number;
  @ApiProperty()
  @IsNotEmpty()
  nb_subscription: number;
  @ApiProperty({ type: () => Workout })
  @IsOptional()
  workout: Workout;
  @ApiProperty()
  @IsNotEmpty()
  is_collective: boolean;
}
