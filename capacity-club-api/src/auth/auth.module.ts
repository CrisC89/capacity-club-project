import { Module } from '@nestjs/common';
import { Credential } from './model/entity/credential.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Token } from './model/entity/token.entity';
import { TokenService } from './jwt/token.service';
import { JwtModule } from '@nestjs/jwt/dist/jwt.module';
import { configManager } from '@common/config/config.manager';
import { ConfigKey } from '@common/config/enum/config-key.enum';
import { Member } from 'domain-modules/member/model';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
/**
 * AuthModule handles the authentication and authorization functionalities.
 * It imports necessary modules, declares providers and controllers, and exports services for use in other modules.
 */
@Module({
  imports: [
    JwtModule.register({
      global: true,
      secret: configManager.getValue(ConfigKey.JWT_TOKEN_SECRET),
      signOptions: {
        expiresIn: configManager.getValue(ConfigKey.JWT_TOKEN_EXPIRE_IN),
      },
    }),
    TypeOrmModule.forFeature([Credential, Token, Member]),
  ],
  exports: [AuthService],
  providers: [AuthService, TokenService],
  controllers: [AuthController],
})
export class AuthModule {}
