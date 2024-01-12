/* eslint-disable prettier/prettier */
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length } from 'class-validator';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { Member } from 'domain-modules/member/model';

export class MemberSubscriptionUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  member_subscription_id: string;
  @ApiProperty()
  start_date: Date;
  @ApiProperty()
  member: Member;
  @ApiProperty()
  member_plan: MemberPlan;
  @ApiProperty()
  active: boolean;
}
