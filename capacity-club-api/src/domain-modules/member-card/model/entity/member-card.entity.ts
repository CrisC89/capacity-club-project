import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { Member } from 'domain-modules/member/model';
import { Column, Entity, JoinColumn, OneToOne, PrimaryColumn } from 'typeorm';

/**
 * Entity representing a member card.
 * This entity represents the member card for each member and allows the member to view the number of individual and collective sessions they have.
 */
@Entity()
export class MemberCard extends BaseEntity {
  /**
   * Unique identifier for the token.
   * Uses a custom transformer for serialization.
   */
  @Transform(uniqueIdTransformer.to, { toClassOnly: true }) // Pour la désérialisation (DB -> Class)
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true }) // Pour la sérialisation (Class -> DB)
  @PrimaryColumn({
    type: 'varchar',
  })
  member_card_id: UniqueId;

  @Column({ default: 0 })
  collective_session_count: number;

  @Column({ default: 0 })
  individual_session_count: number;

  @OneToOne(() => Member, (member) => member.member_card)
  @JoinColumn()
  member: Member;
}
