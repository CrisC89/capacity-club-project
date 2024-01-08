import {
  IsNotEmpty,
  Length,
  IsString,
  IsOptional,
  IsDate,
  IsEnum,
  IsEmail,
  IsArray,
  IsBoolean,
} from 'class-validator';

import { MemberSubscription } from 'domain-modules/member-subscription/model';
import { Gender } from '../enum';
import { ApiProperty } from '@nestjs/swagger';
import { Address } from 'domain-modules/address/model';

export class MemberUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  member_id: string;

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
  @IsEmail()
  @IsOptional()
  @Length(1, 50)
  mail: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 50)
  phone: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 34)
  iban: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 10)
  code_activation: string;

  @ApiProperty()
  @IsOptional()
  @IsArray()
  subscriptions: MemberSubscription[];

  @ApiProperty()
  @IsOptional()
  address: Address;

  @ApiProperty()
  @IsOptional()
  @IsBoolean()
  active: boolean;
}
