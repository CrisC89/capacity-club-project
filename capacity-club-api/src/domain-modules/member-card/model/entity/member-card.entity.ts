import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { Member } from 'domain-modules/member/model';
import { Column, Entity, JoinColumn, OneToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class MemberCard extends BaseEntity {
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
