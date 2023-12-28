import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Token } from './model/entity/token.entity';
import { Credential } from './model/entity/credential.entity';
import { TokenService } from './jwt/token.service';

@Module({
  imports: [TypeOrmModule.forFeature([Credential, Token])],
  providers: [TokenService],
})
export class SecurityModule {}
