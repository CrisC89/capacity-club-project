import { uniqueIdTransformer, UniqueId } from '@common/model';
import { ApiProperty } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IndoorTraining } from 'domain-modules/indoor-training/model';
import { Member } from 'domain-modules/member/model';
import { Workout } from 'domain-modules/workout/model';
import {
  BaseEntity,
  Column,
  Entity,
  JoinColumn,
  OneToOne,
  PrimaryColumn,
} from 'typeorm';

@Entity()
export class IndoorTrainingSubscription extends BaseEntity {
  /**
   * Unique identifier for the indoor training.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  indoor_training_subscription_id: UniqueId;
  @Column({ nullable: false })
  purchase_date: Date;
  @Column({ nullable: false })
  start_hours: string;
  @OneToOne(() => IndoorTraining, {
    lazy: true,
    nullable: true,
  })
  @JoinColumn({
    name: 'indoor_training_id',
    referencedColumnName: 'indoor_training_id',
  })
  @ApiProperty({ type: () => IndoorTraining })
  indoor_training: Promise<IndoorTraining>;

  @OneToOne(() => Member, {
    lazy: true,
    nullable: true,
  })
  @JoinColumn({
    name: 'member_id',
    referencedColumnName: 'member_id',
  })
  @ApiProperty({ type: () => Member })
  member: Promise<Member>;
}
