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
import { MemberSubscriptionModule } from 'domain-modules/member-subscription/member-subscription.module';
import { CollectiveTrainingModule } from 'domain-modules/collective-training/collective-training.module';

@Module({
  imports: [
    TypeOrmModule.forRoot(configManager.getTypeOrmConfig()),
    AuthenticatedModule,
    MemberModule,
    MemberPlanModule,
    MemberSubscriptionModule,
    ExerciseDataModule,
    ExerciseTrainingModule,
    TrainingCircuitModule,
    WorkoutModule,
    CollectiveTrainingModule,
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
