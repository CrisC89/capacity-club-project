import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { configManager } from '@common/config/config.manager';
import { JwtGuard } from '@authenticated/jwt/jwt.guard';
import { APP_GUARD } from '@nestjs/core';
import { AuthenticatedModule } from '@authenticated/authenticated.module';
import { MemberModule } from 'domain-modules/member/member.module';
import { MemberPlanModule } from 'domain-modules/member-plan/member-plan.module';

@Module({
  imports: [
    TypeOrmModule.forRoot(configManager.getTypeOrmConfig()),
    AuthenticatedModule,
    MemberModule,
    MemberPlanModule,
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide: APP_GUARD,
      useClass: JwtGuard,
    },
  ],
})
export class AppModule {}
