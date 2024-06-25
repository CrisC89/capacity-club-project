import {
  IsNotEmpty,
  Length,
  IsOptional,
  IsString,
  IsNumber,
} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { UniqueId } from '@common/model/unique-id';
import { memberPlanProperties } from '@common/documentation';
import { ApiCodeResponse } from '@common/api';

/**
 * Class used to update member plan.
 * This class defines the payload used when updating existing member plan.
 */
export class MemberPlanUpdatePayload {
  @ApiProperty({
    name: memberPlanProperties.member_plan_id.name,
    description: memberPlanProperties.member_plan_id.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.MEMBER_PLAN_ID_IS_MISSING,
  })
  @Length(26, 26)
  member_plan_id: UniqueId;

  @ApiProperty({
    name: memberPlanProperties.title.name,
    description: memberPlanProperties.title.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.MEMBER_PLAN_TITLE_IS_MISSING,
  })
  @Length(1, 80, {
    message: ApiCodeResponse.MEMBER_PLAN_TITLE_LENGTH_ERROR,
  })
  title: string;

  @ApiProperty({
    name: memberPlanProperties.description.name,
    description: memberPlanProperties.description.description,
  })
  @IsString({
    message: ApiCodeResponse.MEMBER_PLAN_DESCRIPTION_INVALID,
  })
  @IsOptional()
  description: string;

  @ApiProperty({
    name: memberPlanProperties.nb_individual_training.name,
    description: memberPlanProperties.nb_individual_training.description,
  })
  @IsNumber()
  @IsOptional()
  nb_individual_training: number;

  @ApiProperty({
    name: memberPlanProperties.nb_collective_training.name,
    description: memberPlanProperties.nb_collective_training.description,
  })
  @IsNumber()
  @IsOptional()
  nb_collective_training: number;

  @ApiProperty({
    name: memberPlanProperties.price.name,
    description: memberPlanProperties.price.description,
  })
  @IsNumber()
  @IsNotEmpty({
    message: ApiCodeResponse.MEMBER_PLAN_PRICE_IS_MISSING,
  })
  price: number;
}
