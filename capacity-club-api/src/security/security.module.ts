import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Token } from './model/entity/token.entity';
import { Credential } from './model/entity/credential.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Credential, Token])],
})
export class SecurityModule {}
