import { forwardRef, Module } from '@nestjs/common';
import { MemberHomeTrainingService } from './member-home-training.service';
import { MemberHomeTrainingController } from './member-home-training.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberModule } from 'domain-modules/member/member.module';
import { HomeTrainingModule } from 'domain-modules/home-training/home-training.module';
import { MemberHomeTraining } from './model/entity/member_home_training.entity';

/**
 * Module for managing MemberHomeTraining.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([MemberHomeTraining]),
    forwardRef(() => MemberModule),
    forwardRef(() => HomeTrainingModule),
  ],
  providers: [MemberHomeTrainingService],
  controllers: [MemberHomeTrainingController],
  exports: [MemberHomeTrainingService],
})
export class MemberHomeTrainingModule {}
