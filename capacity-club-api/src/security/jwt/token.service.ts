import { configManager, ConfigKey } from '@common/config';
import { Injectable, Logger } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Credential, RefreshTokenPayload, Token } from '@security/model';
import {
  TokenExpiredException,
  TokenGenerationException,
} from '@security/model/security.exception';
import { Builder } from 'builder-pattern';
import { Repository } from 'typeorm';

//Change credential reposotory bu crrdential srevice
@Injectable()
export class TokenService {
  private readonly logger = new Logger(TokenService.name);

  constructor(
    @InjectRepository(Token) private readonly repository: Repository<Token>,
    @InjectRepository(Credential)
    private readonly credentialRepository: Repository<Credential>,
    private jwtService: JwtService,
  ) {}

  async getTokens(credential: Credential): Promise<Token> {
    try {
      await this.deleteFor(credential);
      // Create payload for the token based on credential_id.
      const payload = { sub: credential.credential_id };
      // Generate a new token using JWT service with a specific secret and expiry time.
      const token = await this.jwtService.signAsync(payload, {
        secret: configManager.getValue(ConfigKey.JWT_TOKEN_SECRET),
        expiresIn: configManager.getValue(ConfigKey.JWT_TOKEN_EXPIRE_IN),
      });
      // Generates a new refresh token, which may have a different expiration and secret
      // for enhanced security.
      const refreshToken = await this.jwtService.signAsync(payload, {
        secret: configManager.getValue(ConfigKey.JWT_REFRESH_TOKEN_SECRET),
        expiresIn: configManager.getValue(
          ConfigKey.JWT_REFRESH_TOKEN_EXPIRE_IN,
        ),
      });

      // Inserts the new token into the database or updates the existing token.
      // The 'upsert' method decides whether to insert or update based on the 'credential' field.
      await this.repository.upsert(
        Builder<Token>()
          .token(token)
          .refreshToken(refreshToken)
          .credential(credential)
          .build(),
        ['credential'],
      );
      // Retrieves and returns the newly generated token from the database.
      return this.repository.findOneBy({ token: token });
    } catch (e) {
      // Logs the error and throws a custom exception for token generation failures.
      this.logger.error(e.message);
      throw new TokenGenerationException();
    }
  }

  async deleteFor(credential: Credential): Promise<void> {
    // Delete all tokens associated with the given credential.
    await this.repository.delete({ credential });
  }

  async refresh(payload: RefreshTokenPayload): Promise<Token> {
    try {
      // Verify the refresh token and extract the credential_id.
      const id = this.jwtService.verify(payload.refresh, {
        secret: configManager.getValue(ConfigKey.JWT_REFRESH_TOKEN_SECRET),
      }).sub;
      // Fetch the credential details from the database using the extracted user ID.
      const credential = await this.credentialRepository.findOneBy({
        credential_id: id,
      });
      // Generate new access and refresh tokens using the found credentials.
      return await this.getTokens(credential);
    } catch (e) {
      // Log the error and throw a token expiration exception if something goes wrong.
      this.logger.error(e.message);
      throw new TokenExpiredException();
    }
  }
}
