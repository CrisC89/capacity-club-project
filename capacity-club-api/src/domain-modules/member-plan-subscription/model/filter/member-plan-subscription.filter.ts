import { ApiProperty } from '@nestjs/swagger';
import { MemberCard } from 'domain-modules/member-card/model/entity';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { Member } from 'domain-modules/member/model';

/**
 * Class used to filter member plan subscription.
 * This class defines the criteria used to filter a list of member plan subscription.
 */
export class MemberPlanSubscriptionFilter {
  @ApiProperty()
  purchase_date: Date;
  @ApiProperty()
  member: Member;
  @ApiProperty()
  member_plan: MemberPlan;
  @ApiProperty()
  member_card: MemberCard;
}
