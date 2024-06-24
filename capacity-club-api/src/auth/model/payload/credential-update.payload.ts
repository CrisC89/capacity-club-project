import { ApiCodeResponse } from '@common/api';
import { credentialProperties } from '@common/documentation';
import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length, IsOptional } from 'class-validator';

/**
 * DTO (Data Transfer Object) for updating user credentials.
 * This class defines the structure and validation rules for the payload used when updating user credentials.
 */
export class CredentialUpdatepPayload {
  @ApiProperty({
    name: credentialProperties.credential_id.name,
    description: credentialProperties.credential_id.description,
  })
  @IsNotEmpty()
  credential_id: UniqueId;
  @ApiProperty({
    name: credentialProperties.username.name,
    description: credentialProperties.username.description,
  })
  @IsOptional()
  username: string;

  @ApiProperty({
    name: credentialProperties.password.name,
    description: credentialProperties.password.description,
  })
  @IsOptional()
  @Length(1, 10, {
    message: ApiCodeResponse.SIGNUP_PAYLOAD_PASSWORD_LENGTH_ERROR,
  })
  password: string;

  @ApiProperty({
    name: credentialProperties.google_hash.name,
    description: credentialProperties.google_hash.description,
  })
  @IsOptional()
  googleHash: string;
  @ApiProperty({
    name: credentialProperties.facebook_hash.name,
    description: credentialProperties.facebook_hash.description,
  })
  @IsOptional()
  facebookHash: string;
}
