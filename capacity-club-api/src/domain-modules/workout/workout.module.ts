import { Module } from '@nestjs/common';
import { WorkoutService } from './workout.service';
import { WorkoutController } from './workout.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Workout } from './model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';

/**
 * Module for managing Workout.
 */
@Module({
  imports: [TypeOrmModule.forFeature([Workout, TrainingCircuit])],
  providers: [WorkoutService],
  controllers: [WorkoutController],
})
export class WorkoutModule {}
