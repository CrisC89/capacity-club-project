import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Address } from 'domain-modules/address/model';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { MemberController } from './member.controller';
import { Member } from './model';
import { MemberService } from './member.service';
import { MemberPlanSubscription } from 'domain-modules/member-plan-subscription/model';
import { Credential } from '@auth/model';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model';
import { IndoorTraining } from 'domain-modules/indoor-training/model';
import { MemberCard } from 'domain-modules/member-card/model/entity';

/**
 * Module for managing Member.
 */
@Module({
  imports: [
    TypeOrmModule.forFeature([
      Member,
      MemberPlan,
      MemberPlanSubscription,
      Address,
      Credential,
      MemberHomeTraining,
      IndoorTraining,
      MemberCard,
    ]),
  ],
  controllers: [MemberController],
  providers: [MemberService],
})
export class MemberModule {}
