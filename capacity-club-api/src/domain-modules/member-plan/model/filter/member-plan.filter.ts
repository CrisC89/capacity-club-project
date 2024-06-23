import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsOptional, Length } from 'class-validator';

/**
 * Class used to filter exercise data.
 * This class defines the criteria used to filter a list of member plans.
 */
export class MemberPlanFilter {
  @ApiProperty()
  @IsOptional()
  @Length(1, 80)
  title: string;

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
  @IsOptional()
  price: number;
}
