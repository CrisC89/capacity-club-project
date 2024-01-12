import { Module } from '@nestjs/common';
import { TrainingCircuitController } from './training-circuit.controller';
import { TrainingCircuitService } from './training-circuit.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TrainingCircuit } from './model';
import { ExerciseTraining } from 'domain-modules/exercise-training/model/entity/exercise-training.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([TrainingCircuit, ExerciseTraining, Workout]),
  ],
  controllers: [TrainingCircuitController],
  providers: [TrainingCircuitService],
})
export class TrainingCircuitModule {}
