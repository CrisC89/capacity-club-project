import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString, Length } from 'class-validator';

export class AddressUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  address_id: UniqueId;
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
