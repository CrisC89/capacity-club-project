import {
  IsOptional,
  IsNotEmpty,
  Length,
  IsString,
  IsNumber,
} from 'class-validator';

import { ApiProperty } from '@nestjs/swagger';
import { memberPlanProperties } from '@common/documentation';
import { ApiCodeResponse } from '@common/api';

/**
 * Class used to create member plan.
 * This class defines the payload used when creating new member plan.
 */
export class MemberPlanCreatePayload {
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
