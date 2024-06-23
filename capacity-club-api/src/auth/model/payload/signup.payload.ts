import { ApiCodeResponse } from '@common/api';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length } from 'class-validator';
/**
 * DTO (Data Transfer Object) for signup payload.
 * This class defines the structure and validation rules for the payload used when a user attempts to sign up.
 */
export class SignupPayload {
  @ApiProperty()
  @IsNotEmpty({ message: ApiCodeResponse.SIGNUP_PAYLOAD_MAIL_IS_MISSING })
  username: string;

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
