import { forwardRef, Module } from '@nestjs/common';
import { IndoorTrainingService } from './indoor-training.service';
import { IndoorTrainingController } from './indoor-training.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { WorkoutModule } from 'domain-modules/workout/workout.module';
import { IndoorTrainingSubscriptionModule } from 'domain-modules/indoor-training-subscription/indoor-training-subscription.module';
import { IndoorTraining } from './model/entity/indoor-training.entity';

/**
 * Module for managing IndoorTraining.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([IndoorTraining]),
    forwardRef(() => WorkoutModule),
    forwardRef(() => IndoorTrainingSubscriptionModule),
  ],
  providers: [IndoorTrainingService],
  controllers: [IndoorTrainingController],
  exports: [IndoorTrainingService],
})
export class IndoorTrainingModule {}
