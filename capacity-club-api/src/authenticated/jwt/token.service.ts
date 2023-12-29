import {
  TokenGenerationException,
  TokenExpiredException,
} from '@authenticated/authenticated.exception';
import { Credential, RefreshTokenPayload, Token } from '@authenticated/model';
import { configManager, ConfigKey } from '@common/config';
import { Injectable, Logger } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { Repository } from 'typeorm';
import { ulid } from 'ulid';

@Injectable()
export class TokenService {
  // Logger for logging messages.
  private readonly logger = new Logger(TokenService.name);

  constructor(
    @InjectRepository(Token) private readonly repository: Repository<Token>,
    @InjectRepository(Credential)
    private readonly credentialRepository: Repository<Credential>,
    private jwtService: JwtService,
  ) {}

  // Generates and returns access and refresh tokens for a given credential.
  async getTokens(credential: Credential): Promise<Token> {
    try {
      // Delete existing tokens for the credential to prevent token reuse.
      await this.repository.delete({ credential });

      // Define payload for JWT.
      const payload = { sub: credential.credential_id };

      // Create a new access token.
      const token = await this.jwtService.signAsync(payload, {
        secret: configManager.getValue(ConfigKey.JWT_TOKEN_SECRET),
        expiresIn: configManager.getValue(ConfigKey.JWT_TOKEN_EXPIRE_IN),
      });

      // Create a new refresh token.
      const refreshToken = await this.jwtService.signAsync(payload, {
        secret: configManager.getValue(ConfigKey.JWT_REFRESH_TOKEN_SECRET),
        expiresIn: configManager.getValue(
          ConfigKey.JWT_REFRESH_TOKEN_EXPIRE_IN,
        ),
      });

      // Insert or update the new tokens in the database.
      await this.repository.upsert(
        Builder<Token>()
          .token_id(ulid())
          .token(token)
          .refreshToken(refreshToken)
          .credential(credential)
          .build(),
        ['credential'],
      );

      // Retrieve and return the new token.
      return this.repository.findOneBy({ token: token });
    } catch (e) {
      // Log error and throw an exception if token generation fails.
      this.logger.error(e.message);
      throw new TokenGenerationException();
    }
  }

  // Deletes tokens associated with a given credential.
  async deleteFor(credential: Credential): Promise<void> {
    await this.repository.delete({ credential });
  }

  // Refreshes the token using the provided refresh token payload.
  async refresh(payload: RefreshTokenPayload): Promise<Token> {
    try {
      // Verify the refresh token and extract the credential_id (sub).
      const id = this.jwtService.verify(payload.refresh, {
        secret: configManager.getValue(ConfigKey.JWT_REFRESH_TOKEN_SECRET),
      }).sub;
      // Fetch the credential details from the database using the extracted credential_id.
      const credential = await this.credentialRepository.findOneBy({
        credential_id: id,
      });
      // Generate and return new tokens for the found credential.
      return await this.getTokens(credential);
    } catch (e) {
      // Log error and throw a token expiration exception if refresh fails.
      this.logger.error(e.message);
      throw new TokenExpiredException();
    }
  }
}
