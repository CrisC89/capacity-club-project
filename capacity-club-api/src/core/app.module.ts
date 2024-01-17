import { CollectiveTrainingSessionModule } from './../domain-modules/collective-training-session/collective-training-session.module';
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
import { WorkoutModule } from 'domain-modules/workout/workout.module';
import { ExerciseDataModule } from 'domain-modules/exercise-data/exercise-data.module';
import { ExerciseTrainingModule } from 'domain-modules/exercise-training/exercise-training.module';
import { TrainingCircuitModule } from 'domain-modules/training-circuit/training-circuit.module';
import { CollectiveTrainingModule } from 'domain-modules/collective-training/collective-training.module';
import { MemberPlanSubscriptionModule } from 'domain-modules/member-plan-subscription/member-plan-subscription.module';
import { AddressModule } from 'domain-modules/address/address.module';

@Module({
  imports: [
    TypeOrmModule.forRoot(configManager.getTypeOrmConfig()),
    AuthenticatedModule,
    MemberModule,
    AddressModule,
    MemberPlanModule,
    MemberPlanSubscriptionModule,
    ExerciseDataModule,
    ExerciseTrainingModule,
    TrainingCircuitModule,
    WorkoutModule,
    CollectiveTrainingModule,
    CollectiveTrainingSessionModule,
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
