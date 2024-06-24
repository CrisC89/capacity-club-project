import { Module } from '@nestjs/common';
import { ExerciseDataController } from './exercise-data.controller';
import { ExerciseDataService } from './exercise-data.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ExerciseData } from './model';
import { ExerciseTraining } from 'domain-modules/exercise-training/model';

/**
 * Module for managing ExerciseData.
 */
@Module({
  imports: [TypeOrmModule.forFeature([ExerciseData, ExerciseTraining])],
  controllers: [ExerciseDataController],
  providers: [ExerciseDataService],
})
export class ExerciseDataModule {}
