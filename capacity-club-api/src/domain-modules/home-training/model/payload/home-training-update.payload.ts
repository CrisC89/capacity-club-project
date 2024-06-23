import { UniqueId } from '@common/model';
import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length } from 'class-validator';
import { Workout } from 'domain-modules/workout/model';

export class HomeTrainingUpdatePayload implements Payload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  home_training_id: UniqueId;
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
  workouts: Workout[];
}
