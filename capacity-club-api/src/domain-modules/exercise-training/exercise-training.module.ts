import { forwardRef, Module } from '@nestjs/common';
import { ExerciseTrainingService } from './exercise-training.service';
import { ExerciseTrainingController } from './exercise-training.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ExerciseDataModule } from 'domain-modules/exercise-data/exercise-data.module';
import { TrainingCircuitModule } from 'domain-modules/training-circuit/training-circuit.module';
import { ExerciseTraining } from './model/entity/exercise-training.entity';

/**
 * Module for managing ExerciseTraining.
 */

@Module({
  imports: [
    TypeOrmModule.forFeature([ExerciseTraining]),
    forwardRef(() => ExerciseDataModule),
    forwardRef(() => TrainingCircuitModule),
  ],
  providers: [ExerciseTrainingService],
  controllers: [ExerciseTrainingController],
  exports: [ExerciseTrainingService],
})
export class ExerciseTrainingModule {}
