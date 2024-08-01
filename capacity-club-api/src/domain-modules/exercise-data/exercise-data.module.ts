import { forwardRef, Module } from '@nestjs/common';
import { ExerciseDataController } from './exercise-data.controller';
import { ExerciseDataService } from './exercise-data.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ExerciseData } from './model';
import { ExerciseTrainingModule } from 'domain-modules/exercise-training/exercise-training.module';

/**
 * Module for managing ExerciseData.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([ExerciseData]),
    forwardRef(() => ExerciseTrainingModule),
  ],
  controllers: [ExerciseDataController],
  providers: [ExerciseDataService],
  exports: [ExerciseDataService],
})
export class ExerciseDataModule {}
