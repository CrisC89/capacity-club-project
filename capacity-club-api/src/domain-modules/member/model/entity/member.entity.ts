import { uniqueIdTransformer, UniqueId } from '@common/model';
import { ApiProperty } from '@nestjs/swagger';
import { Address } from 'domain-modules/address/model/entity/address.entity';
import { IndoorTrainingSubscription } from 'domain-modules/indoor-training-subscription/model/entity/indoor-training-subscription.entity';
import { MemberCard } from 'domain-modules/member-card/model/entity/member-card.entity';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model/entity/member_home_training.entity';
import { MemberPlanSubscription } from 'domain-modules/member-plan-subscription/model/entity/member-plan-subscription.entity';
import { isNil } from 'lodash';
import {
  Entity,
  BaseEntity,
  PrimaryColumn,
  Column,
  OneToMany,
  OneToOne,
  JoinColumn,
  BeforeInsert,
} from 'typeorm';
import { ulid } from 'ulid';
import { Gender } from '../enum/gender.enum';
import { Transform } from 'class-transformer';
import { Credential } from '@auth/model';

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
    lazy: true,
    nullable: true,
  })
  @ApiProperty({ type: () => MemberPlanSubscription, isArray: true })
  member_plan_subscriptions: Promise<MemberPlanSubscription[]>;

  @OneToMany(() => MemberPlanSubscription, (ms) => ms.member, {
    cascade: true,
    lazy: true,
    nullable: true,
  })
  @ApiProperty({ type: () => IndoorTrainingSubscription, isArray: true })
  indoor_training_subscription: Promise<IndoorTrainingSubscription[]>;

  @OneToMany(() => MemberHomeTraining, (mht) => mht.member, {
    cascade: true,
    lazy: true,
    nullable: true,
  })
  @ApiProperty({ type: () => MemberHomeTraining, isArray: true })
  member_home_trainings: Promise<MemberHomeTraining[]>;

  @OneToOne(() => Address, { cascade: true, eager: true, nullable: true })
  @JoinColumn({ referencedColumnName: 'address_id', name: 'address_id_fk' })
  address: Address;

  @OneToOne(() => Credential, { nullable: true, lazy: true })
  @JoinColumn({
    name: 'credential_id_fk',
    referencedColumnName: 'credential_id',
  })
  @ApiProperty({ type: () => Credential })
  credential: Promise<Credential>;

  @OneToOne(() => MemberCard, {
    cascade: true,
    nullable: true,
    lazy: true,
  })
  @JoinColumn({
    name: 'member_card_id_fk',
    referencedColumnName: 'member_card_id',
  })
  @ApiProperty({ type: () => MemberCard })
  member_card: MemberCard;

  @BeforeInsert()
  setCodeActivation() {
    this.code_activation = isNil(this.code_activation)
      ? ulid().substring(0, 10)
      : this.code_activation;
  }
}
