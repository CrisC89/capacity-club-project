import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional } from 'class-validator';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model/entity/member_home_training.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';

/**
 * Class used to create home training.
 * This class defines the payload used when creating new home training.
 */
export class HomeTrainingCreatePayload implements Payload {
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
