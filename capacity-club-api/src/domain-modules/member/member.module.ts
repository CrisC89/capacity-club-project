import { forwardRef, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberController } from './member.controller';
import { MemberService } from './member.service';
import { MemberPlanSubscriptionModule } from 'domain-modules/member-plan-subscription/member-plan-subscription.module';
import { AddressModule } from 'domain-modules/address/address.module';
import { AuthModule } from '@auth/auth.module';
import { MemberHomeTrainingModule } from 'domain-modules/member-home-training/member-home-training.module';
import { IndoorTrainingSubscriptionModule } from 'domain-modules/indoor-training-subscription/indoor-training-subscription.module';
import { MemberCardModule } from 'domain-modules/member-card/member-card.module';
import { Member } from './model/entity/member.entity';

/**
 * Module for managing Member.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([Member]),
    forwardRef(() => MemberPlanSubscriptionModule),
    forwardRef(() => AddressModule),
    forwardRef(() => AuthModule),
    forwardRef(() => MemberHomeTrainingModule),
    forwardRef(() => IndoorTrainingSubscriptionModule),
    forwardRef(() => MemberCardModule),
  ],
  controllers: [MemberController],
  providers: [MemberService],
  exports: [MemberService],
})
export class MemberModule {}
