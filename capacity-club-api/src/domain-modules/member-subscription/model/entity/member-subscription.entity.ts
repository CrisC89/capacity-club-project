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
import { ulid } from 'ulid';

@Entity()
export class MemberSubscription {
  @PrimaryColumn('varchar', { length: 26, default: () => `'${ulid()}'` })
  member_subscription_id: string;
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
