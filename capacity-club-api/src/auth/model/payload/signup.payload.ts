import { ApiCodeResponse } from '@common/api';
import { credentialProperties, signUpProperties } from '@common/documentation';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length } from 'class-validator';
/**
 * DTO (Data Transfer Object) for signup payload.
 * This class defines the structure and validation rules for the payload used when a user attempts to sign up.
 */
export class SignupPayload {
  @ApiProperty({
    name: credentialProperties.username.name,
    description: credentialProperties.username.description,
  })
  @IsNotEmpty({ message: ApiCodeResponse.SIGNUP_PAYLOAD_MAIL_IS_MISSING })
  username: string;

  @ApiProperty({
    name: credentialProperties.password.name,
    description: credentialProperties.password.description,
  })
  @IsNotEmpty({ message: ApiCodeResponse.SIGNUP_PAYLOAD_PASSWORD_IS_MISSING })
  @Length(1, 10, {
    message: ApiCodeResponse.SIGNUP_PAYLOAD_PASSWORD_LENGTH_ERROR,
  })
  password: string;

  @ApiProperty({
    name: credentialProperties.google_hash.name,
    description: credentialProperties.google_hash.description,
  })
  googleHash: string;
  @ApiProperty({
    name: credentialProperties.facebook_hash.name,
    description: credentialProperties.facebook_hash.description,
  })
  facebookHash: string;
  @ApiProperty({
    name: signUpProperties.code_activation.name,
    description: credentialProperties.credential_id.description,
  })
  code_activation: string;
}
