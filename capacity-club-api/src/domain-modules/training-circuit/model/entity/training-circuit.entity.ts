import { BaseEntity } from '@common/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { ExerciseTraining } from 'domain-modules/exercise-training/model/entity/exercise-training.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';

import {
  Entity,
  PrimaryColumn,
  Column,
  OneToMany,
  ManyToOne,
  JoinColumn,
} from 'typeorm';

@Entity()
export class TrainingCircuit extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  training_circuit_id: UniqueId;
  @Column({ nullable: false })
  title: string;

  @OneToMany(
    () => ExerciseTraining,
    (exerciseTraining) => exerciseTraining.training_circuit,
    {
      cascade: true,
      eager: true,
    },
  )
  exercise_training_list: ExerciseTraining[];

  @ManyToOne(() => Workout, (workout) => workout.training_circuits)
  @JoinColumn({ referencedColumnName: 'workout_id', name: 'workout_id' })
  workout: Workout;
}
