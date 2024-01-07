import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Address } from 'domain-modules/address/model';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { MemberSubscription } from 'domain-modules/member-subscription/model';
import { Member } from './model';

@Module({
  imports: [
    TypeOrmModule.forFeature([Member, MemberPlan, MemberSubscription, Address]),
  ],
})
export class MemberModule {}
