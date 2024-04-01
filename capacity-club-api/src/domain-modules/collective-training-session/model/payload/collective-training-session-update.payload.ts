import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { Workout } from 'domain-modules/workout/model';

export class CollectiveTrainingSessionUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  collective_training_session_id: UniqueId;
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
  workout: Workout;
}
