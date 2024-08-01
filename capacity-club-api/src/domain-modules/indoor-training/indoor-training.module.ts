import { Module } from '@nestjs/common';
import { IndoorTrainingService } from './indoor-training.service';
import { IndoorTrainingController } from './indoor-training.controller';
import { IndoorTraining } from './model';
import { Member } from 'domain-modules/member/model';
import { Workout } from 'domain-modules/workout/model';
import { TypeOrmModule } from '@nestjs/typeorm';

/**
 * Module for managing IndoorTraining.
 */
@Module({
  imports: [TypeOrmModule.forFeature([IndoorTraining, Member, Workout])],
  providers: [IndoorTrainingService],
  controllers: [IndoorTrainingController],
  exports: [IndoorTrainingService],
})
export class IndoorTrainingModule {}
