import {
  IsNotEmpty,
  Length,
  IsString,
  IsOptional,
  IsDate,
  IsEnum,
  IsArray,
  IsBoolean,
  IsEmail,
} from 'class-validator';

import { Credential } from '@auth/model';
import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { Address } from 'domain-modules/address/model/entity/address.entity';
import { IndoorTrainingSubscription } from 'domain-modules/indoor-training-subscription/model/entity/indoor-training-subscription.entity';
import { MemberCard } from 'domain-modules/member-card/model/entity/member-card.entity';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model/entity/member_home_training.entity';
import { MemberPlanSubscription } from 'domain-modules/member-plan-subscription/model/entity/member-plan-subscription.entity';
import { Gender } from '../enum/gender.enum';

export class MemberUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  member_id: UniqueId;

  @ApiProperty()
  @IsString()
  @IsOptional()
  @Length(1, 50)
  firstname: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  @Length(1, 50)
  lastname: string;

  @ApiProperty()
  @IsDate()
  @IsOptional()
  birthdate: Date;

  @ApiProperty()
  @IsEnum(Gender)
  @IsOptional()
  gender: Gender;

  @ApiProperty()
  @IsOptional()
  @Length(1, 50)
  phone: string;

  @ApiProperty()
  @IsOptional()
  @IsEmail()
  mail: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 10)
  code_activation: string;

  @ApiProperty()
  @IsOptional()
  @IsBoolean()
  active: boolean;

  @ApiProperty({ type: () => MemberPlanSubscription, isArray: true })
  @IsOptional()
  @IsArray()
  member_plan_subscriptions: MemberPlanSubscription[];

  @ApiProperty({ type: () => MemberHomeTraining, isArray: true })
  member_home_trainings: MemberHomeTraining[];

  @ApiProperty({ type: () => IndoorTrainingSubscription, isArray: true })
  indoor_training_subscription: IndoorTrainingSubscription[];

  @ApiProperty({ type: () => Address })
  @IsOptional()
  address: Address;

  @ApiProperty({ type: () => Credential })
  @IsOptional()
  credential: Credential;

  @ApiProperty({ type: () => MemberCard })
  @IsOptional()
  member_card: MemberCard;
}
