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
import { Credential } from '@authenticated/model';

@Entity()
export class Member extends BaseEntity {
  @PrimaryColumn('varchar')
  member_id: string;
  @Column({ length: 50, nullable: true })
  firstname: string;
  @Column({ length: 50, nullable: true })
  lastname: string;
  @Column({ nullable: true })
  birthdate: Date;
  @Column('varchar', { nullable: true, default: Gender.OTHER })
  gender: Gender;
  @Column({ length: 50, nullable: true })
  mail: string;
  @Column({ length: 15, nullable: true })
  phone: string;
  @Column({ length: 34, nullable: true })
  iban: string;
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
  @OneToOne(() => Address, { cascade: true, eager: true, nullable: true })
  @JoinColumn({ referencedColumnName: 'address_id', name: 'address_id_fk' })
  address: Address;

  @OneToOne(() => Credential, { nullable: true })
  @JoinColumn({
    name: 'credential_id_fk',
    referencedColumnName: 'credential_id',
  })
  credential: Credential;

  @BeforeInsert()
  setCodeActivation() {
    console.log('im here', this.code_activation);
    this.code_activation = isNil(this.code_activation)
      ? ulid().substring(0, 10)
      : this.code_activation;
  }
}
