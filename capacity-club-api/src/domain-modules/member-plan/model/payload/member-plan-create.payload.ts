import {
  IsOptional,
  IsNotEmpty,
  Length,
  IsString,
  IsNumber,
} from 'class-validator';

import { ApiProperty } from '@nestjs/swagger';

/**
 * Class used to create member plan.
 * This class defines the payload used when creating new member plan.
 */
export class MemberPlanCreatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(1, 80)
  title: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  description: string;

  @ApiProperty()
  @IsNumber()
  @IsOptional()
  nb_individual_training: number;

  @ApiProperty()
  @IsNumber()
  @IsOptional()
  nb_collective_training: number;

  @ApiProperty()
  @IsNumber()
  @IsNotEmpty()
  price: number;
}
