import {
  IsString,
  IsOptional,
  Length,
  IsDate,
  IsEnum,
  IsArray,
  IsBoolean,
} from 'class-validator';

import { Gender } from '../enum';
import { ApiProperty } from '@nestjs/swagger';
import { Address } from 'domain-modules/address/model';
import { MemberPlanSubscription } from 'domain-modules/member-plan-subscription/model';
import { Credential } from '@authenticated/model';

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
  @Length(1, 10)
  code_activation: string;

  @ApiProperty()
  @IsOptional()
  @IsBoolean()
  active: boolean;

  @ApiProperty()
  @IsOptional()
  @IsArray()
  subscriptions: MemberPlanSubscription[];

  @ApiProperty()
  @IsOptional()
  address: Address;

  @ApiProperty()
  @IsOptional()
  credential: Credential;
}
