import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { Column, Entity, PrimaryColumn } from 'typeorm';

/**
 * Entity representing a member card.
 * This entity represents the member card for each member and allows the member to view the number of individual and collective sessions they have.
 */
@Entity()
export class MemberCard extends BaseEntity {
  /**
   * Unique identifier for the member_card.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  member_card_id: UniqueId;

  @Column({ default: 0 })
  collective_session_count: number;

  @Column({ default: 0 })
  individual_session_count: number;
}
