import { Module } from '@nestjs/common';
import { MemberHomeTrainingService } from './member-home-training.service';
import { MemberHomeTrainingController } from './member-home-training.controller';

@Module({
  providers: [MemberHomeTrainingService],
  controllers: [MemberHomeTrainingController]
})
export class MemberHomeTrainingModule {}
