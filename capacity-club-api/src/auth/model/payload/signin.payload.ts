import { ApiCodeResponse } from '@common/api';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional } from 'class-validator';
/**
 * DTO (Data Transfer Object) for sign-in payload.
 * This class defines the structure and validation rules for the payload used when a user attempts to sign in.
 */
export class SignInPayload {
  @ApiProperty()
  @IsNotEmpty({ message: ApiCodeResponse.SIGNUP_PAYLOAD_MAIL_IS_MISSING })
  username: string;

  @IsNotEmpty({ message: ApiCodeResponse.SIGN_IN_PAYLOAD_PASSWORD_MISSING })
  @ApiProperty()
  password: string;

  @ApiProperty()
  @IsOptional()
  googleHash: string;

  @IsOptional()
  @ApiProperty()
  facebookHash: string;

  @ApiProperty()
  @IsNotEmpty({ message: ApiCodeResponse.SIGN_IN_PAYLOAD_SOCIAL_LOGIN_MISSING })
  socialLogin: boolean;
}
