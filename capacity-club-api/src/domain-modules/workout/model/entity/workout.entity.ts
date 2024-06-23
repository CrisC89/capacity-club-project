import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
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
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity';

/**
 * Entity representing a workout.
 * A workout includes multiple training circuits.
 */
@Entity()
export class Workout extends BaseEntity {
  /**
   * Unique identifier for the workout.
   * Uses a custom transformer for serialization.
   */
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

  @ManyToOne(() => IndoorTraining, { nullable: true, eager: false })
  indoor_training: IndoorTraining;
  @ManyToOne(() => HomeTraining, { nullable: true, eager: false })
  home_training: HomeTraining;
}
