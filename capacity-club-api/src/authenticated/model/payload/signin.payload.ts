import { ApiCodeResponse } from '@common/api';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsEmail, IsOptional } from 'class-validator';
export class SignInPayload {
  @ApiProperty()
  @IsNotEmpty({ message: ApiCodeResponse.SIGNUP_PAYLOAD_MAIL_IS_MISSING })
  @IsEmail(undefined, { message: ApiCodeResponse.SIGNUP_PAYLOAD_MAIL_INVALID })
  mail: string;
  /*
    @ApiProperty()
    @IsNotEmpty({message:ApiCodeResponse.SIGN_IN_PAYLOAD_USERNAME_MISSING})
    @Length(1,50,{message:ApiCodeResponse.SIGN_IN_PAYLOAD_USERNAME_LENGTH_ERROR})
    username: string;
    */

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
