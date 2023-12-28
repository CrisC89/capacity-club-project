import { Module } from '@nestjs/common';
import { AuthenticatedService } from './service/authenticated.service';
import { Credential } from './model/entity/credential.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Token } from './model/entity/token.entity';
import { TokenService } from './jwt/token.service';

@Module({
  imports: [TypeOrmModule.forFeature([Credential, Token])],
  providers: [AuthenticatedService, TokenService],
})
export class AuthenticatedModule {}
