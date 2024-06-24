import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString, IsOptional } from 'class-validator';

/**
 * Class used to filter address.
 * This class defines the criteria used to filter a list of address.
 */
export class AddressFilter {
  @ApiProperty()
  @IsOptional()
  @IsString()
  street: string;
  @ApiProperty()
  @IsOptional()
  @IsString()
  number: string;
  @ApiProperty()
  @IsOptional()
  @IsString()
  zipcode: string;
  @ApiProperty()
  @IsOptional()
  @IsString()
  town: string;
  @ApiProperty()
  @IsOptional()
  @IsString()
  country: string;
  @ApiProperty()
  @IsOptional()
  @IsString()
  complement: string;
}
