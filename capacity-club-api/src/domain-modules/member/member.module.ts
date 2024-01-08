import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Address } from 'domain-modules/address/model';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { MemberSubscription } from 'domain-modules/member-subscription/model';
import { MemberController } from './member.controller';
import { Member } from './model';
import { MemberService } from './member.service';

@Module({
  imports: [
    TypeOrmModule.forFeature([Member, MemberPlan, MemberSubscription, Address]),
  ],
  controllers: [MemberController],
  providers: [MemberService],
})
export class MemberModule {}
