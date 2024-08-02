import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IndoorTrainingSubscription } from 'domain-modules/indoor-training-subscription/model/entity/indoor-training-subscription.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';
import {
  Column,
  Entity,
  JoinColumn,
  OneToMany,
  OneToOne,
  PrimaryColumn,
} from 'typeorm';
/**
 * Entity representing an indoor training session.
 * These training sessions can be individual or collective.
 */
@Entity()
export class IndoorTraining extends BaseEntity {
  /**
   * Unique identifier for the indoor training.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  indoor_training_id: UniqueId;
  @Column({ nullable: true })
  title: string;
  @Column({ nullable: false })
  training_date: Date;
  @Column({ nullable: false })
  start_hours: string;
  @Column({ nullable: true })
  end_hours: string;
  @Column({ nullable: false })
  nb_place: number;
  @Column({ nullable: false })
  nb_subscription: number;
  @Column({ nullable: false })
  is_collective: boolean;
  @Column({ nullable: true })
  is_active: boolean;

  @OneToOne(() => Workout, {
    lazy: true,
    nullable: true,
  })
  @JoinColumn({ name: 'workout_id', referencedColumnName: 'workout_id' })
  @ApiProperty({ type: () => Workout })
  workout: Promise<Workout>;
  @OneToMany(() => IndoorTrainingSubscription, (data) => data.indoor_training, {
    cascade: true,
    lazy: true,
    nullable: true,
  })
  @ApiProperty({ type: () => IndoorTrainingSubscription, isArray: true })
  indoor_training_subscription_list: Promise<IndoorTrainingSubscription[]>;
}
