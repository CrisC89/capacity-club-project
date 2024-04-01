import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { CollectiveTrainingSession } from 'domain-modules/collective-training-session/model';
import { Member } from 'domain-modules/member/model';
import { Workout } from 'domain-modules/workout/model';
import { PrimaryColumn, JoinColumn, OneToOne, Entity } from 'typeorm';

@Entity()
export class CollectiveTraining extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  collective_training_id: UniqueId;
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
