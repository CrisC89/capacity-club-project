import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { configManager } from '@common/config/config.manager';
import { JwtGuard } from '@auth/jwt/jwt.guard';
import { APP_GUARD } from '@nestjs/core';
import { AuthModule } from '@auth/auth.module';
import { MemberModule } from 'domain-modules/member/member.module';
import { MemberPlanModule } from 'domain-modules/member-plan/member-plan.module';
import { WorkoutModule } from 'domain-modules/workout/workout.module';
import { ExerciseDataModule } from 'domain-modules/exercise-data/exercise-data.module';
import { ExerciseTrainingModule } from 'domain-modules/exercise-training/exercise-training.module';
import { TrainingCircuitModule } from 'domain-modules/training-circuit/training-circuit.module';
import { MemberPlanSubscriptionModule } from 'domain-modules/member-plan-subscription/member-plan-subscription.module';
import { AddressModule } from 'domain-modules/address/address.module';
import { MemberCardModule } from 'domain-modules/member-card/member-card.module';
import { HomeTrainingModule } from 'domain-modules/home-training/home-training.module';
import { IndoorTrainingModule } from 'domain-modules/indoor-training/indoor-training.module';
import { MemberHomeTrainingModule } from 'domain-modules/member-home-training/member-home-training.module';
import { IndoorTrainingSubscriptionModule } from 'domain-modules/indoor-training-subscription/indoor-training-subscription.module';
/**
 * AppModule is the root module of the application.
 *
 * It imports various feature modules and configures TypeORM with the database settings.
 */
@Module({
  imports: [
    TypeOrmModule.forRoot(configManager.getTypeOrmConfig()),
    AuthModule,
    MemberModule,
    AddressModule,
    MemberPlanModule,
    MemberPlanSubscriptionModule,
    ExerciseDataModule,
    ExerciseTrainingModule,
    TrainingCircuitModule,
    WorkoutModule,
    MemberCardModule,
    HomeTrainingModule,
    IndoorTrainingModule,
    IndoorTrainingSubscriptionModule,
    MemberHomeTrainingModule,
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
