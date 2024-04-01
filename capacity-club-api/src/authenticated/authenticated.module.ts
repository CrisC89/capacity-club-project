import { Module } from '@nestjs/common';
import { AuthenticatedService } from './authenticated.service';
import { Credential } from './model/entity/credential.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Token } from './model/entity/token.entity';
import { TokenService } from './jwt/token.service';
import { AuthenticatedController } from './authenticated.controller';
import { JwtModule } from '@nestjs/jwt/dist/jwt.module';
import { configManager } from '@common/config/config.manager';
import { ConfigKey } from '@common/config/enum/config-key.enum';
import { Member } from 'domain-modules/member/model';

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
  exports: [AuthenticatedService],
  providers: [AuthenticatedService, TokenService],
  controllers: [AuthenticatedController],
})
export class AuthenticatedModule {}
