import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { Workout } from 'domain-modules/workout/model';
import { PrimaryColumn, Column, JoinColumn, OneToOne, Entity } from 'typeorm';

@Entity()
export class CollectiveTraining extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  collective_training_id: UniqueId;
  @Column({ nullable: false })
  title: string;
  @Column({ nullable: false })
  training_date: Date;
  @Column({ nullable: false })
  start_hours: string;
  @Column({ nullable: false })
  end_hours: string;
  @Column({ nullable: false })
  nb_place: number;
  @Column({ nullable: false })
  nb_subscription: number;

  @OneToOne(() => Workout)
  @JoinColumn({ name: 'workout_id', referencedColumnName: 'workout_id' })
  workout: Workout;
}
