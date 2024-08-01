import { forwardRef, Module } from '@nestjs/common';
import { MemberPlanSubscriptionController } from './member-plan-subscription.controller';
import { MemberPlanSubscriptionService } from './member-plan-subscription.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberPlanSubscription } from './model';
import { Member } from 'domain-modules/member/model';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { MemberCard } from 'domain-modules/member-card/model/entity';
import { MemberService } from 'domain-modules/member/member.service';
import { MemberPlanService } from 'domain-modules/member-plan/member-plan.service';
import { MemberCardService } from 'domain-modules/member-card/member-card.service';
import { MemberModule } from 'domain-modules/member/member.module';
import { MemberPlanModule } from 'domain-modules/member-plan/member-plan.module';
import { MemberCardModule } from 'domain-modules/member-card/member-card.module';

/**
 * Module for managing MemberPlanSubscription.
 */

@Module({
  imports: [
    TypeOrmModule.forFeature([MemberPlanSubscription]),
    forwardRef(() => MemberModule),
    forwardRef(() => MemberPlanModule),
    forwardRef(() => MemberCardModule),
  ],
  controllers: [MemberPlanSubscriptionController],
  providers: [MemberPlanSubscriptionService],
  exports: [MemberPlanSubscriptionService],
})
export class MemberPlanSubscriptionModule {}
