import { ApiCodeResponse } from '@common/api';
import { addressProperties } from '@common/documentation';
import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString, Length } from 'class-validator';

/**
 * Class used to update address.
 * This class defines the payload used when updating existing address.
 */
export class AddressUpdatePayload {
  @ApiProperty({
    name: addressProperties.address_id.name,
    description: addressProperties.address_id.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.ADDRESS_PAYLOAD_ID_IS_MISSING,
  })
  @Length(26, 26)
  address_id: UniqueId;
  @ApiProperty({
    name: addressProperties.street.name,
    description: addressProperties.street.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.ADDRESS_PAYLOAD_STREET_IS_MISSING,
  })
  @IsString()
  street: string;
  @ApiProperty({
    name: addressProperties.number.name,
    description: addressProperties.number.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.ADDRESS_PAYLOAD_NUMBER_IS_MISSING,
  })
  @IsString()
  number: string;
  @ApiProperty({
    name: addressProperties.zipcode.name,
    description: addressProperties.zipcode.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.ADDRESS_PAYLOAD_ZIPCODE_IS_MISSING,
  })
  @IsString()
  zipcode: string;
  @ApiProperty({
    name: addressProperties.town.name,
    description: addressProperties.town.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.ADDRESS_PAYLOAD_TOWN_IS_MISSING,
  })
  @IsString()
  town: string;
  @ApiProperty({
    name: addressProperties.country.name,
    description: addressProperties.country.description,
  })
  @IsNotEmpty({
    message: ApiCodeResponse.ADDRESS_PAYLOAD_COUNTRY_IS_MISSING,
  })
  @IsString()
  country: string;
  @ApiProperty({
    name: addressProperties.complement.name,
    description: addressProperties.complement.description,
  })
  @IsOptional()
  @IsString()
  complement: string;
}
