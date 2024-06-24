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
import { ApiProperty } from '@nestjs/swagger';

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
      lazy: true,
    },
  )
  @ApiProperty({ type: () => TrainingCircuit, isArray: true })
  training_circuits: Promise<TrainingCircuit[]>;

  @ManyToOne(() => IndoorTraining, { nullable: true, lazy: true })
  @ApiProperty({ type: () => IndoorTraining })
  indoor_training: Promise<IndoorTraining>;

  @ManyToOne(() => HomeTraining, { nullable: true, lazy: true })
  @ApiProperty({ type: () => HomeTraining })
  home_training: Promise<HomeTraining>;
}
