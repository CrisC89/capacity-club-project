import { BaseEntity } from '@common/model/base.entity';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Exclude, Transform } from 'class-transformer';
import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Credential extends BaseEntity {
  @Transform(uniqueIdTransformer.to, { toClassOnly: true }) // Pour la désérialisation (DB -> Class)
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true }) // Pour la sérialisation (Class -> DB)
  @PrimaryColumn({
    type: 'varchar',
  })
  credential_id: UniqueId;

  @Column({ nullable: false, unique: true })
  username: string;

  @Exclude({ toPlainOnly: true })
  @Column({ nullable: true })
  password: string;

  @Column({ nullable: true, unique: false })
  facebookHash: string;

  @Column({ nullable: true, unique: false })
  googleHash: string;

  @Column({ default: false })
  isAdmin: boolean;

  @Column({ default: true })
  active: boolean;
}
