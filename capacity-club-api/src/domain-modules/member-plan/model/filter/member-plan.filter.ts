import { ApiProperty } from '@nestjs/swagger';
import {
  IsOptional,
  IsEnum,
  IsNotEmpty,
  Length,
  IsString,
  IsNumber,
  IsBoolean,
} from 'class-validator';
import {
  MemberPlanType,
  MemberPlanPayment,
  MemberPlanFreqTraining,
} from '../enum';

export class MemberPlanFilter {
  @ApiProperty()
  @IsOptional()
  @IsEnum(MemberPlanType)
  type: MemberPlanType;

  @ApiProperty()
  @IsNotEmpty()
  @Length(1, 80)
  title: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  description: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 40)
  picture: string;

  @ApiProperty()
  @IsNumber()
  @IsNotEmpty()
  price: number;

  @ApiProperty()
  @IsNumber()
  @IsNotEmpty()
  nb_month: number;

  @ApiProperty()
  @IsOptional()
  @IsEnum(MemberPlanPayment)
  payment: MemberPlanPayment;

  @ApiProperty()
  @IsBoolean()
  @IsOptional()
  cumulative: boolean;

  @ApiProperty()
  @IsNumber()
  @IsOptional()
  nb_training: number;

  @ApiProperty()
  @IsOptional()
  @IsEnum(MemberPlanFreqTraining)
  freq_training: MemberPlanFreqTraining;
}
