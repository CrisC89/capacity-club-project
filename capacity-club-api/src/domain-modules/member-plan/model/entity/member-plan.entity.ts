import { Column, Entity, PrimaryColumn } from 'typeorm';
import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
/**
 * Entity representing member plans.
 * These plans are used to recharge training credits on a member's card.
 */
@Entity()
export class MemberPlan extends BaseEntity {
  /**
   * Unique identifier for the member plan.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  member_plan_id: UniqueId;
  @Column({ length: 80, nullable: false })
  title: string;
  @Column('text', { nullable: true })
  description: string;
  @Column({ default: 10 })
  nb_individual_training: number;
  @Column({ default: 10 })
  nb_collective_training: number;
  @Column({ nullable: false })
  price: number;
}
