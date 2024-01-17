import { BaseEntity } from '@common/model';
import { CollectiveTrainingSession } from 'domain-modules/collective-training-session/model';
import { Member } from 'domain-modules/member/model';
import { Workout } from 'domain-modules/workout/model';
import { PrimaryColumn, JoinColumn, OneToOne, Entity } from 'typeorm';

@Entity()
export class CollectiveTraining extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26 })
  collective_training_id: string;
  @OneToOne(() => Member)
  @JoinColumn({
    name: 'member_id',
    referencedColumnName: 'member_id',
  })
  member: Member;
  @OneToOne(() => CollectiveTrainingSession)
  @JoinColumn({
    name: 'collective_training_session_id',
    referencedColumnName: 'collective_training_session_id',
  })
  collective_training_session: CollectiveTrainingSession;
  @OneToOne(() => Workout)
  @JoinColumn({ name: 'workout_id', referencedColumnName: 'workout_id' })
  workout: Workout;
}
