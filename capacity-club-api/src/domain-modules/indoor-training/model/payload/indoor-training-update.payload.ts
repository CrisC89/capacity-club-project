import { UniqueId } from '@common/model';
import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, Length } from 'class-validator';
import { IndoorTrainingSubscription } from 'domain-modules/indoor-training-subscription/model/entity/indoor-training-subscription.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';

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
  @ApiProperty()
  @IsNotEmpty()
  is_collective: boolean;
  @ApiProperty()
  @IsNotEmpty()
  is_active: boolean;
  @ApiProperty({ type: () => Workout })
  @IsOptional()
  workout: Workout;
  @ApiProperty({
    type: () => IndoorTrainingSubscription,
    isArray: true,
  })
  @IsOptional()
  indoor_training_subscription_list: IndoorTrainingSubscription[];
}
