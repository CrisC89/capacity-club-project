import { ApiProperty } from '@nestjs/swagger';
import { Workout } from 'domain-modules/workout/model';

export class CollectiveTrainingCreatePayload {
  @ApiProperty()
  title: string;
  @ApiProperty()
  training_date: Date;
  @ApiProperty()
  start_hours: string;
  @ApiProperty()
  end_hours: string;
  @ApiProperty()
  nb_place: number;
  @ApiProperty()
  nb_subscription: number;
  @ApiProperty()
  workout: Workout;
}
