import { Module } from '@nestjs/common';
import { MemberPlanService } from './member-plan.service';
import { MemberPlanController } from './member-plan.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberPlan } from './model';

/**
 * Module for managing MemberPlan.
 */
@Module({
  imports: [TypeOrmModule.forFeature([MemberPlan])],
  providers: [MemberPlanService],
  controllers: [MemberPlanController],
  exports: [MemberPlanService],
})
export class MemberPlanModule {}
