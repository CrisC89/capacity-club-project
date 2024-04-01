import {
  IsNotEmpty,
  Length,
  IsOptional,
  IsEnum,
  IsString,
  IsNumber,
  IsBoolean,
} from 'class-validator';
import {
  MemberPlanType,
  MemberPlanPayment,
  MemberPlanFreqTraining,
} from '../enum';
import { ApiProperty } from '@nestjs/swagger';
import { UniqueId } from '@common/model/unique-id';

export class MemberPlanUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  member_plan_id: UniqueId;

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
  @IsOptional()
  price: number;

  @ApiProperty()
  @IsNumber()
  @IsOptional()
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
