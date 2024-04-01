/* eslint-disable prettier/prettier */
import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length } from 'class-validator';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { Member } from 'domain-modules/member/model';

export class MemberPlanSubscriptionUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  member_plan_subscription_id: UniqueId;
  @ApiProperty()
  start_date: Date;
  @ApiProperty()
  member: Member;
  @ApiProperty()
  member_plan: MemberPlan;
  @ApiProperty()
  active: boolean;
}
