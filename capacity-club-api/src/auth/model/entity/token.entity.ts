import { Column, Entity, JoinColumn, OneToOne, PrimaryColumn } from 'typeorm';
import { Credential } from './credential.entity';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { BaseEntity } from '@common/model';
import { Transform } from 'class-transformer';

@Entity()
export class Token extends BaseEntity {
  /**
   * Unique identifier for the token.
   * Uses a custom transformer for serialization.
   */
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  @PrimaryColumn('varchar')
  token_id: UniqueId;
  // JWT token string
  @Column({ nullable: false })
  token: string;

  // Refresh token string
  @Column({ nullable: false })
  refreshToken: string;

  // Associated Credential entity
  @OneToOne(() => Credential, { eager: true })
  @JoinColumn({
    name: 'credential_id_fk',
    referencedColumnName: 'credential_id',
  })
  credential: Credential;
}
