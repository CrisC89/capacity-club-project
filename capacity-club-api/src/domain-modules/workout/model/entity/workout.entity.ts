import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { CollectiveTraining } from '@common/collective-training/model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';
import {
  BaseEntity,
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryColumn,
} from 'typeorm';
import { HomeTraining } from 'domain-modules/home-training/model/entity/home-training.entity';
@Entity()
export class Workout extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  workout_id: UniqueId;
  @Column({ nullable: false })
  title: string;

  @OneToMany(
    () => TrainingCircuit,
    (trainingCircuit) => trainingCircuit.workout,
    {
      cascade: true,
      eager: true,
    },
  )
  training_circuits: TrainingCircuit[];

  @ManyToOne(() => CollectiveTraining, { nullable: true, eager: false })
  collective_training: CollectiveTraining;
  @ManyToOne(() => HomeTraining, { nullable: true, eager: false })
  home_training: HomeTraining;
}
