import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { ApiProperty } from '@nestjs/swagger';
import { HomeTraining } from 'domain-modules/home-training/model/entity/home-training.entity';
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity/indoor-training.entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model/entity/training-circuit.entity';
import { Entity, PrimaryColumn, Column, OneToMany, ManyToOne } from 'typeorm';
import { BaseEntity } from '@common/model';

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
