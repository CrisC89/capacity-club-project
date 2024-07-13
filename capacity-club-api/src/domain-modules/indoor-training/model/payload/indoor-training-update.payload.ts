import { UniqueId } from '@common/model';
import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, Length } from 'class-validator';
import { Workout } from 'domain-modules/workout/model';

/**
 * Class used to update indoor training.
 * This class defines the payload used when updating existing indoor training.
 */
export class IndoorTrainingUpdatePayload implements Payload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  indoor_training_id: UniqueId;
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
}
