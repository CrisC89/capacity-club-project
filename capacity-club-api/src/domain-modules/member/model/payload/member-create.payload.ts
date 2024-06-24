import {
  IsString,
  IsOptional,
  Length,
  IsDate,
  IsEnum,
  IsArray,
  IsBoolean,
  IsEmail,
} from 'class-validator';

import { Gender } from '../enum';
import { ApiProperty } from '@nestjs/swagger';
import { Address } from 'domain-modules/address/model';
import { MemberPlanSubscription } from 'domain-modules/member-plan-subscription/model';
import { Credential } from '@auth/model';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model';

/**
 * Class used to create member.
 * This class defines the payload used when creating new member.
 */
export class MemberCreatePayload {
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
  subscriptions: MemberPlanSubscription[];

  @ApiProperty({ type: () => MemberHomeTraining, isArray: true })
  member_home_trainings: MemberHomeTraining;

  @ApiProperty()
  @IsOptional()
  address: Address;

  @ApiProperty({ type: () => Credential })
  @IsOptional()
  credential: Credential;
}
