/* eslint-disable prettier/prettier */
import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length } from 'class-validator';
import { MemberCard } from 'domain-modules/member-card/model/entity/member-card.entity';
import { MemberPlan } from 'domain-modules/member-plan/model';
import { Member } from 'domain-modules/member/model';

/**
 * Class used to update  member plan subscription.
 * This class defines the payload used when updating existing  member plan subscription.
 */

export class MemberPlanSubscriptionUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  member_plan_subscription_id: UniqueId;
  @ApiProperty()
  purchase_date: Date;
  @ApiProperty()
  member: Member;
  @ApiProperty()
  member_plan: MemberPlan;
  @ApiProperty()
  member_card: MemberCard;
}
