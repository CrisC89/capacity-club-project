import { Address } from 'domain-modules/address/model';
import {
  Entity,
  PrimaryColumn,
  Column,
  OneToMany,
  OneToOne,
  JoinColumn,
  BeforeInsert,
} from 'typeorm';
import { ulid } from 'ulid';
import { Gender } from '../enum';
import { isNil } from 'lodash';
import { BaseEntity } from '@common/model';
import { MemberPlanSubscription } from 'domain-modules/member-plan-subscription/model';
import { Credential } from '@auth/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { MemberCard } from 'domain-modules/member-card/model/entity/member-card.entity';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model/entity';

/**
 * Entity representing a member.
 * Contains personal details, subscriptions, home trainings, address, credentials, and member card.
 */
@Entity()
export class Member extends BaseEntity {
  /**
   * Unique identifier for the member.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  member_id: UniqueId;
  @Column({ length: 50, nullable: true })
  firstname: string;
  @Column({ length: 50, nullable: true })
  lastname: string;
  @Column({ nullable: true })
  birthdate: Date;
  @Column('varchar', { nullable: true, default: Gender.OTHER })
  gender: Gender;
  @Column({ length: 15, nullable: true })
  phone: string;
  @Column({ nullable: true })
  mail: string;
  @Column({ length: 10, nullable: true })
  code_activation: string;
  @Column({ default: false })
  active: boolean;

  @OneToMany(() => MemberPlanSubscription, (ms) => ms.member, {
    cascade: true,
    eager: true,
    nullable: true,
  })
  subscriptions: MemberPlanSubscription[];

  @OneToMany(() => MemberHomeTraining, (mht) => mht.member, {
    cascade: true,
    eager: true,
    nullable: true,
  })
  member_home_trainings: MemberHomeTraining[];

  @OneToOne(() => Address, { cascade: true, eager: true, nullable: true })
  @JoinColumn({ referencedColumnName: 'address_id', name: 'address_id_fk' })
  address: Address;

  @OneToOne(() => Credential, { nullable: true, eager: true })
  @JoinColumn({
    name: 'credential_id_fk',
    referencedColumnName: 'credential_id',
  })
  credential: Credential;

  @OneToOne(() => MemberCard, (memberCard) => memberCard.member, {
    cascade: true,
    nullable: true,
  })
  @JoinColumn()
  member_card: MemberCard;

  @BeforeInsert()
  setCodeActivation() {
    this.code_activation = isNil(this.code_activation)
      ? ulid().substring(0, 10)
      : this.code_activation;
  }
}
