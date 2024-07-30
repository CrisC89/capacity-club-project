import {
  TokenGenerationException,
  TokenExpiredException,
} from '@auth/auth.exception';
import { Credential, RefreshTokenPayload, Token } from '@auth/model';
import { configManager, ConfigKey } from '@common/config';
import { UniqueId } from '@common/model/unique-id';
import { Injectable, Logger } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { Repository } from 'typeorm';

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

  /**
   * Generates and returns access and refresh tokens for a given credential.
   * @param credential - The credential for which to generate tokens.
   * @returns The generated tokens.
   * @throws TokenGenerationException if token generation fails.
   */
  async getTokens(credential: Credential): Promise<Token> {
    try {
      await this.repository.delete({
        credential: { credential_id: credential.credential_id },
      });

      const payload = { sub: credential.credential_id };
      const token = await this.jwtService.signAsync(payload, {
        secret: configManager.getValue(ConfigKey.JWT_TOKEN_SECRET),
        expiresIn: configManager.getValue(ConfigKey.JWT_TOKEN_EXPIRE_IN),
      });

      const refreshToken = await this.jwtService.signAsync(payload, {
        secret: configManager.getValue(ConfigKey.JWT_REFRESH_TOKEN_SECRET),
        expiresIn: configManager.getValue(
          ConfigKey.JWT_REFRESH_TOKEN_EXPIRE_IN,
        ),
      });

      await this.repository.upsert(
        Builder<Token>()
          .token_id(UniqueId.generate())
          .token(token)
          .refreshToken(refreshToken)
          .credential(credential)
          .build(),
        ['credential'],
      );

      return await this.repository.findOneBy({ token: token });
    } catch (e) {
      this.logger.error(e.message);
      throw new TokenGenerationException();
    }
  }

  /**
   * Deletes tokens associated with a given credential.
   * @param credential - The credential for which to delete tokens.
   */
  async deleteFor(credential: Credential): Promise<void> {
    await this.repository.delete({
      credential: { credential_id: credential.credential_id },
    });
  }

  /**
   * Refreshes the token using the provided refresh token payload.
   * @param payload - The refresh token payload.
   * @returns The new tokens.
   * @throws TokenExpiredException if the refresh token is expired or invalid.
   */
  async refresh(payload: RefreshTokenPayload): Promise<Token> {
    try {
      const id = this.jwtService.verify(payload.refresh, {
        secret: configManager.getValue(ConfigKey.JWT_REFRESH_TOKEN_SECRET),
      }).sub;
      const credential = await this.credentialRepository.findOneBy({
        credential_id: id,
      });
      /*
      const credential = await this.credentialRepository.findOneBy({
        credential_id: UniqueId.from(id),
      });
      */
      return await this.getTokens(credential);
    } catch (e) {
      this.logger.error(e.message);
      throw new TokenExpiredException();
    }
  }
}
