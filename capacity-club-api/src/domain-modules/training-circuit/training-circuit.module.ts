import { forwardRef, Module } from '@nestjs/common';
import { TrainingCircuitController } from './training-circuit.controller';
import { TrainingCircuitService } from './training-circuit.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ExerciseTrainingModule } from 'domain-modules/exercise-training/exercise-training.module';
import { WorkoutModule } from 'domain-modules/workout/workout.module';
import { TrainingCircuit } from './model/entity/training-circuit.entity';

/**
 * Module for managing TrainingCircuit.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([TrainingCircuit]),
    forwardRef(() => ExerciseTrainingModule),
    forwardRef(() => WorkoutModule),
  ],
  controllers: [TrainingCircuitController],
  providers: [TrainingCircuitService],
  exports: [TrainingCircuitService],
})
export class TrainingCircuitModule {}
