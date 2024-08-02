import { forwardRef, Module } from '@nestjs/common';
import { MemberPlanSubscriptionController } from './member-plan-subscription.controller';
import { MemberPlanSubscriptionService } from './member-plan-subscription.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberModule } from 'domain-modules/member/member.module';
import { MemberPlanModule } from 'domain-modules/member-plan/member-plan.module';
import { MemberCardModule } from 'domain-modules/member-card/member-card.module';
import { MemberPlanSubscription } from './model/entity/member-plan-subscription.entity';

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
