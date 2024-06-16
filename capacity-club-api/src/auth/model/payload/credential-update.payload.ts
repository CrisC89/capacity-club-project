import { ApiCodeResponse } from '@common/api';
import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length, IsOptional } from 'class-validator';
export class CredentialUpdatepPayload {
  @ApiProperty()
  @IsNotEmpty()
  credential_id: UniqueId;
  @ApiProperty()
  @IsOptional()
  username: string;

  @ApiProperty()
  @IsOptional()
  @Length(1, 10, {
    message: ApiCodeResponse.SIGNUP_PAYLOAD_PASSWORD_LENGTH_ERROR,
  })
  password: string;

  @ApiProperty()
  @IsOptional()
  googleHash: string;
  @ApiProperty()
  @IsOptional()
  facebookHash: string;
}
