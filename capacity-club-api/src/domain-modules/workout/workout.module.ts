import { Module } from '@nestjs/common';
import { WorkoutService } from './workout.service';
import { WorkoutController } from './workout.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Workout } from './model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';
import { IndoorTraining } from 'domain-modules/indoor-training/model';
import { HomeTraining } from 'domain-modules/home-training/model/entity';

/**
 * Module for managing Workout.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([
      Workout,
      TrainingCircuit,
      IndoorTraining,
      HomeTraining,
    ]),
  ],
  providers: [WorkoutService],
  controllers: [WorkoutController],
})
export class WorkoutModule {}
