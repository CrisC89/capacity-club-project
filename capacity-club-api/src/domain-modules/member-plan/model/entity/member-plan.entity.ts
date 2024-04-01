import { Column, Entity, PrimaryColumn } from 'typeorm';
import { ulid } from 'ulid';
import { BaseEntity } from '@common/model';
import {
  MemberPlanFreqTraining,
  MemberPlanPayment,
  MemberPlanType,
} from '../enum';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
@Entity()
export class MemberPlan extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  member_plan_id: UniqueId;
  @Column({ nullable: false, default: MemberPlanType.SUBSCRIPTION })
  type: MemberPlanType;
  @Column({ length: 80, nullable: false })
  title: string;
  @Column('text', { nullable: true })
  description: string;
  @Column({ length: 40, nullable: true })
  picture: string;
  @Column({ nullable: false })
  price: number;
  @Column({ nullable: false })
  nb_month: number;
  @Column({ default: MemberPlanPayment.MENSUAL })
  payment: MemberPlanPayment;
  @Column({ default: true })
  cumulative: boolean;
  @Column({ default: 7 })
  nb_training: number;
  @Column({ default: MemberPlanFreqTraining.PER_WEEK })
  freq_training: MemberPlanFreqTraining;
}
