import { BaseEntity, UniqueId, uniqueIdTransformer } from '@common/model';
import { Transform } from 'class-transformer';
import { Member } from 'domain-modules/member/model';
import {
  PrimaryColumn,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';

/**
 * Entity representing the association between a member and a home training program.
 * This entity indicates the purchase of a home training program by a member.
 * It links the home training templates to the specific home training instances owned by the member.
 */
export class MemberHomeTraining extends BaseEntity {
  /**
   * Unique identifier for the member plan subscription.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  member_home_training_id: UniqueId;
  @CreateDateColumn()
  purchase_date: Date;
  @ManyToOne(() => Member, { eager: false })
  @JoinColumn({ referencedColumnName: 'member_id', name: 'member_id_fk' })
  member: Member;
}
