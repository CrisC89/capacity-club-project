import { ApiCodeResponse } from '@common/api';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsEmail, Length } from 'class-validator';
export class SignupPayload {
  @ApiProperty()
  @IsNotEmpty({ message: ApiCodeResponse.SIGNUP_PAYLOAD_MAIL_IS_MISSING })
  @IsEmail(undefined, { message: ApiCodeResponse.SIGNUP_PAYLOAD_MAIL_INVALID })
  mail: string;

  @ApiProperty()
  @IsNotEmpty({ message: ApiCodeResponse.SIGNUP_PAYLOAD_PASSWORD_IS_MISSING })
  @Length(1, 10, {
    message: ApiCodeResponse.SIGNUP_PAYLOAD_PASSWORD_LENGTH_ERROR,
  })
  password: string;

  @ApiProperty()
  googleHash: string;
  @ApiProperty()
  facebookHash: string;
  @ApiProperty()
  code_activation: string;
}
