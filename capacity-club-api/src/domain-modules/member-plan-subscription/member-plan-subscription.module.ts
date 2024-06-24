import { Module } from '@nestjs/common';
import { MemberPlanSubscriptionController } from './member-plan-subscription.controller';
import { MemberPlanSubscriptionService } from './member-plan-subscription.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberPlanSubscription } from './model';
import { Member } from 'domain-modules/member/model';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { MemberCard } from 'domain-modules/member-card/model/entity';

/**
 * Module for managing MemberPlanSubscription.
 */

@Module({
  imports: [
    TypeOrmModule.forFeature([
      MemberPlanSubscription,
      Member,
      MemberPlan,
      MemberCard,
    ]),
  ],
  controllers: [MemberPlanSubscriptionController],
  providers: [MemberPlanSubscriptionService],
})
export class MemberPlanSubscriptionModule {}
