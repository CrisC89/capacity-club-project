import { BaseEntity } from '@common/model/base.entity';
import { Exclude } from 'class-transformer';
import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Credential extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26 })
  credential_id: string;

  @Column({ nullable: false, unique: true })
  mail: string;

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
