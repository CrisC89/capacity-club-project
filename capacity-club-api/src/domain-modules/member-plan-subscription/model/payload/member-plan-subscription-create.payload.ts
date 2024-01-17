import { ApiProperty } from '@nestjs/swagger';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { Member } from 'domain-modules/member/model';

export class MemberPlanSubscriptionCreatePayload {
  @ApiProperty()
  start_date: Date;
  @ApiProperty()
  member: Member;
  @ApiProperty()
  member_plan: MemberPlan;
  @ApiProperty()
  active: boolean;
}
