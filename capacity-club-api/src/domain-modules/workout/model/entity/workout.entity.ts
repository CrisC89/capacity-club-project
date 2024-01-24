import { CollectiveTraining } from 'domain-modules/collective-training/model/entity/collective-training.entity';
import { PersonnalTraining } from 'domain-modules/personnal-training/model/entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';
import {
  BaseEntity,
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryColumn,
} from 'typeorm';
@Entity()
export class Workout extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26 })
  workout_id: string;
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
  @ManyToOne(() => PersonnalTraining, { nullable: true, eager: false })
  personnal_training: PersonnalTraining;
}
