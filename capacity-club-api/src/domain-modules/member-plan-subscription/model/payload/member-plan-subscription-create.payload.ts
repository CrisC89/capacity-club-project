import { ApiProperty } from '@nestjs/swagger';
import { MemberCard } from 'domain-modules/member-card/model/entity/member-card.entity';
import { MemberPlan } from 'domain-modules/member-plan/model/entity/member-plan.entity';
import { Member } from 'domain-modules/member/model/entity/member.entity';

/**
 * Class used to create member plan subscription.
 * This class defines the payload used when creating new member plan subscription.
 */
export class MemberPlanSubscriptionCreatePayload {
  @ApiProperty()
  purchase_date: Date;
  @ApiProperty({ type: () => Member })
  member: Member;
  @ApiProperty()
  member_plan: MemberPlan;
  @ApiProperty()
  member_card: MemberCard;
}
