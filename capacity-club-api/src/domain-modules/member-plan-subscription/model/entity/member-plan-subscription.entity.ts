import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { MemberCard } from 'domain-modules/member-card/model/entity';
import { MemberPlan } from 'domain-modules/member-plan/model/entity';
import { Member } from 'domain-modules/member/model';
import {
  Entity,
  PrimaryColumn,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  OneToOne,
} from 'typeorm';

/**
 * Entity for recording the purchase history of member plans by members.
 */
@Entity()
export class MemberPlanSubscription {
  /**
   * Unique identifier for the member plan subscription.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  member_plan_subscription_id: UniqueId;
  @CreateDateColumn()
  purchase_date: Date;
  @ManyToOne(() => Member, { eager: false })
  @JoinColumn({ referencedColumnName: 'member_id', name: 'member_id_fk' })
  member: Member;
  @OneToOne(() => MemberPlan, { eager: true })
  @JoinColumn({
    referencedColumnName: 'member_plan_id',
    name: 'member_plan_id_fk',
  })
  member_plan: MemberPlan;
  @OneToOne(() => MemberPlan, { eager: true })
  @JoinColumn({
    referencedColumnName: 'member_card_id',
    name: 'member_card_id_fk',
  })
  member_card: MemberCard;
}
