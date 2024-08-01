import { forwardRef, Module } from '@nestjs/common';
import { WorkoutService } from './workout.service';
import { WorkoutController } from './workout.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Workout } from './model';
import { IndoorTrainingModule } from 'domain-modules/indoor-training/indoor-training.module';
import { TrainingCircuitModule } from 'domain-modules/training-circuit/training-circuit.module';
import { HomeTrainingModule } from 'domain-modules/home-training/home-training.module';

/**
 * Module for managing Workout.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([Workout]),
    forwardRef(() => TrainingCircuitModule),
    forwardRef(() => IndoorTrainingModule),
    forwardRef(() => HomeTrainingModule),
  ],
  providers: [WorkoutService],
  controllers: [WorkoutController],
  exports: [WorkoutService],
})
export class WorkoutModule {}
