import { Module } from '@nestjs/common';
import { MemberHomeTrainingService } from './member-home-training.service';
import { MemberHomeTrainingController } from './member-home-training.controller';
import { MemberHomeTraining } from './model';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HomeTraining } from 'domain-modules/home-training/model/entity';
import { Member } from 'domain-modules/member/model';

/**
 * Module for managing MemberHomeTraining.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([MemberHomeTraining, HomeTraining, Member]),
  ],
  providers: [MemberHomeTrainingService],
  controllers: [MemberHomeTrainingController],
})
export class MemberHomeTrainingModule {}
