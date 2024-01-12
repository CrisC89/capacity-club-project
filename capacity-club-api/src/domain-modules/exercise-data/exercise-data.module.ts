import { Module } from '@nestjs/common';
import { ExerciseDataController } from './exercise-data.controller';
import { ExerciseDataService } from './exercise-data.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ExerciseData } from './model';

@Module({
  imports: [TypeOrmModule.forFeature([ExerciseData])],
  controllers: [ExerciseDataController],
  providers: [ExerciseDataService],
})
export class ExerciseDataModule {}
