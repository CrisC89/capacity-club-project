import { ApiProperty } from '@nestjs/swagger';
/**
 * DTO (Data Transfer Object) for refresh token payload.
 * This class defines the structure for the payload used when requesting a token refresh.
 */
export class RefreshTokenPayload {
  @ApiProperty()
  refresh: string;
}
