import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { MemberPlan } from 'domain-modules/member-plan/model/entity';
import { Member } from 'domain-modules/member/model';
import {
  Entity,
  PrimaryColumn,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  OneToOne,
  Column,
} from 'typeorm';

@Entity()
export class MemberPlanSubscription {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  member_plan_subscription_id: UniqueId;
  @CreateDateColumn()
  start_date: Date;
  @ManyToOne(() => Member, { eager: false })
  @JoinColumn({ referencedColumnName: 'member_id', name: 'member_id_fk' })
  member: Member;
  @OneToOne(() => MemberPlan, { eager: true })
  @JoinColumn({
    referencedColumnName: 'member_plan_id',
    name: 'member_plan_id_fk',
  })
  member_plan: MemberPlan;
  @Column({ default: false })
  active: boolean;
}
