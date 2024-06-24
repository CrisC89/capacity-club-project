import { ApiCodeResponse } from '@common/api';
import { credentialProperties, signInProperties } from '@common/documentation';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional } from 'class-validator';
/**
 * DTO (Data Transfer Object) for sign-in payload.
 * This class defines the structure and validation rules for the payload used when a user attempts to sign in.
 */
export class SignInPayload {
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
  @IsNotEmpty({ message: ApiCodeResponse.SIGN_IN_PAYLOAD_PASSWORD_MISSING })
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

  @ApiProperty({
    name: signInProperties.social_login.name,
    description: signInProperties.social_login.description,
  })
  @IsNotEmpty({ message: ApiCodeResponse.SIGN_IN_PAYLOAD_SOCIAL_LOGIN_MISSING })
  socialLogin: boolean;
}
