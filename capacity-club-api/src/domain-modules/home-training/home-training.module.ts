import { forwardRef, Module } from '@nestjs/common';
import { HomeTrainingController } from './home-training.controller';
import { HomeTrainingService } from './home-training.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { WorkoutModule } from 'domain-modules/workout/workout.module';
import { MemberHomeTrainingModule } from 'domain-modules/member-home-training/member-home-training.module';
import { HomeTraining } from './model/entity/home-training.entity';

/**
 * Module for managing HomeTraining.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([HomeTraining]),
    forwardRef(() => WorkoutModule),
    forwardRef(() => MemberHomeTrainingModule),
  ],
  controllers: [HomeTrainingController],
  providers: [HomeTrainingService],
  exports: [HomeTrainingService],
})
export class HomeTrainingModule {}
