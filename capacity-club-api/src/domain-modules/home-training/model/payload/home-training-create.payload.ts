import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { Workout } from 'domain-modules/workout/model';

/**
 * Class used to create home training.
 * This class defines the payload used when creating new home training.
 */
export class HomeTrainingCreatePayload implements Payload {
  @ApiProperty()
  @IsNotEmpty()
  title: string;
  @ApiProperty()
  @IsNotEmpty()
  nb_week: number;
  @ApiProperty()
  @IsNotEmpty()
  nb_training_by_week: number;
  @ApiProperty()
  @IsNotEmpty()
  price: number;
  @ApiProperty({ type: () => Workout, isArray: true })
  @IsNotEmpty()
  workouts: Workout[];
}
