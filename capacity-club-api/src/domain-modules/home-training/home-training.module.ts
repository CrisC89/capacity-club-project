import { HomeTraining } from 'domain-modules/home-training/model/entity';
import { Module } from '@nestjs/common';
import { HomeTrainingController } from './home-training.controller';
import { HomeTrainingService } from './home-training.service';
import { Workout } from 'domain-modules/workout/model';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model';

/**
 * Module for managing HomeTraining.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([HomeTraining, Workout, MemberHomeTraining]),
  ],
  controllers: [HomeTrainingController],
  providers: [HomeTrainingService],
  exports: [HomeTrainingService],
})
export class HomeTrainingModule {}
