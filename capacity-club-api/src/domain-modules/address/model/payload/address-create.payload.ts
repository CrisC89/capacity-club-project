import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString, IsOptional } from 'class-validator';

/**
 * Class used to create address.
 * This class defines the payload used when creating new address.
 */
export class AddressCreatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @IsString()
  street: string;
  @ApiProperty()
  @IsNotEmpty()
  @IsString()
  number: string;
  @ApiProperty()
  @IsNotEmpty()
  @IsString()
  zipcode: string;
  @ApiProperty()
  @IsNotEmpty()
  @IsString()
  town: string;
  @ApiProperty()
  @IsNotEmpty()
  @IsString()
  country: string;
  @ApiProperty()
  @IsOptional()
  @IsString()
  complement: string;
}
