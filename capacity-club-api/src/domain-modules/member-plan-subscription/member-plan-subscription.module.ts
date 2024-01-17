import { Module } from '@nestjs/common';
import { MemberPlanSubscriptionController } from './member-plan-subscription.controller';
import { MemberPlanSubscriptionService } from './member-plan-subscription.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberPlanSubscription } from './model';

@Module({
  imports: [TypeOrmModule.forFeature([MemberPlanSubscription])],
  controllers: [MemberPlanSubscriptionController],
  providers: [MemberPlanSubscriptionService],
})
export class MemberPlanSubscriptionModule {}
