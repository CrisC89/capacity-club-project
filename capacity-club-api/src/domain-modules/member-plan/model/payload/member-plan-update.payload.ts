import {
  IsNotEmpty,
  Length,
  IsOptional,
  IsString,
  IsNumber,
} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { UniqueId } from '@common/model/unique-id';

/**
 * Class used to update member plan.
 * This class defines the payload used when updating existing member plan.
 */
export class MemberPlanUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  member_plan_id: UniqueId;

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
