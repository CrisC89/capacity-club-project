import { UniqueId } from '@common/model';
import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, Length } from 'class-validator';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model/entity/member_home_training.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';

/**
 * Class used to update home training.
 * This class defines the payload used when updating existing home training.
 */
export class HomeTrainingUpdatePayload implements Payload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  home_training_id: UniqueId;
  @ApiProperty()
  @IsNotEmpty()
  title: string;
  @ApiProperty()
  @IsOptional()
  description: string;
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
  @ApiProperty({ type: () => MemberHomeTraining, isArray: true })
  @IsNotEmpty()
  member_home_trainings: MemberHomeTraining[];
}
