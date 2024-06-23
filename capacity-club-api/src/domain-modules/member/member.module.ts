import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Address } from 'domain-modules/address/model';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { MemberController } from './member.controller';
import { Member } from './model';
import { MemberService } from './member.service';
import { MemberPlanSubscription } from 'domain-modules/member-plan-subscription/model';
import { Credential } from '@auth/model';

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
    ]),
  ],
  controllers: [MemberController],
  providers: [MemberService],
})
export class MemberModule {}
