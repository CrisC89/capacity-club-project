import { Module } from '@nestjs/common';
import { ExerciseTrainingService } from './exercise-training.service';
import { ExerciseTrainingController } from './exercise-training.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ExerciseTraining } from './model';
import { ExerciseData } from 'domain-modules/exercise-data/model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';

@Module({
  imports: [
    TypeOrmModule.forFeature([ExerciseTraining, ExerciseData, TrainingCircuit]),
  ],
  providers: [ExerciseTrainingService],
  controllers: [ExerciseTrainingController],
})
export class ExerciseTrainingModule {}
