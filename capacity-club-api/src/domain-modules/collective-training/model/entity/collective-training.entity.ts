import { BaseEntity } from '@common/model';
import { Workout } from 'domain-modules/workout/model';
import { PrimaryColumn, Column, JoinColumn, OneToOne, Entity } from 'typeorm';

@Entity()
export class CollectiveTraining extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26 })
  collective_training_id: string;
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

  @OneToOne(() => Workout)
  @JoinColumn({ name: 'workout_id', referencedColumnName: 'workout_id' })
  workout: Workout;

  //many to many with member
}
