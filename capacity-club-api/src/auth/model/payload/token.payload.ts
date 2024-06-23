/**
 * DTO (Data Transfer Object) for token payload.
 * This class defines the structure for the payload containing token information.
 */
export class TokenPayload {
  token_id: string;
  token: string;
  refreshToken: string;
  credential: string;
}
