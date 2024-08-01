import { BaseEntity } from '@common/model/base.entity';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { Exclude, Transform } from 'class-transformer';
import { Member } from 'domain-modules/member/model';
import { Column, Entity, JoinColumn, OneToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class Credential extends BaseEntity {
  /**
   * Unique identifier for the crendential.
   * Uses a custom transformer for serialization.
   */
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  @PrimaryColumn({
    type: 'varchar',
  })
  credential_id: UniqueId;

  // Username for the credential
  @Column({ nullable: false, unique: true })
  username: string;

  // Password for the credential, excluded from plain serialization
  @Exclude({ toPlainOnly: true })
  @Column({ nullable: true })
  password: string;

  // Facebook hash associated with the credential
  @Column({ nullable: true, unique: false })
  facebookHash: string;

  // Google hash associated with the credential
  @Column({ nullable: true, unique: false })
  googleHash: string;

  // Flag indicating if the user is an admin
  @Column({ default: false })
  is_admin: boolean;

  // Flag indicating if the user is an admin
  @Column({ default: true })
  is_active: boolean;

  // Member associated with the credential
  @OneToOne(() => Member, { nullable: true, lazy: true })
  @JoinColumn({
    name: 'member_id_fk',
    referencedColumnName: 'member_id',
  })
  @ApiProperty({ type: () => Member })
  member: Promise<Member>;
}
