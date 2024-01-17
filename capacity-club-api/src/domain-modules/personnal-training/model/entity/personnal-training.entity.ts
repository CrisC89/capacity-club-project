import { BaseEntity } from '@common/model';
import { Member } from 'domain-modules/member/model';
import { Workout } from 'domain-modules/workout/model';
import {
  Entity,
  PrimaryColumn,
  Column,
  OneToOne,
  JoinColumn,
  OneToMany,
} from 'typeorm';

@Entity()
export class PersonnalTraining extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26 })
  personnal_training_id: string;
  @Column({ nullable: false })
  title: string;
  @Column({ nullable: false })
  training_start_date: Date;
  @Column({ nullable: false })
  training_end_date: Date;

  @OneToOne(() => Member)
  @JoinColumn({ name: 'member_id', referencedColumnName: 'member_id' })
  member: Member;

  @OneToMany(() => Workout, (workout) => workout.personnal_training, {
    cascade: true,
    eager: true,
  })
  workouts: Workout[];
}
