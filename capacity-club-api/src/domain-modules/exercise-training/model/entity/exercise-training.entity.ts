import { BaseEntity } from '@common/model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';
import { PrimaryColumn, Column, ManyToOne, JoinColumn, Entity } from 'typeorm';
import { TrainingIntensity } from '../enum';
import { ExerciseData } from 'domain-modules/exercise-data/model';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';

/**
 * Entity representing a specific exercise training session.
 * This entity allows coaches to adapt the general exercise data to a specific training session.
 */
@Entity()
export class ExerciseTraining extends BaseEntity {
  /**
   * Unique identifier for the exercise training.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  exercise_training_id: UniqueId;
  @Column({ nullable: false })
  nb_reps: number;
  @Column('varchar', { nullable: true })
  intensity: string;
  @Column('varchar', { nullable: false, default: TrainingIntensity.RPE })
  intensityType: TrainingIntensity;

  @ManyToOne(() => ExerciseData, {
    eager: false,
  })
  @JoinColumn({
    referencedColumnName: 'exercise_data_id',
    name: 'exercise_data_id',
  })
  exercise_data: ExerciseData;

  @ManyToOne(
    () => TrainingCircuit,
    (training_circuit) => training_circuit.exercise_training_list,
  )
  @JoinColumn({
    referencedColumnName: 'training_circuit_id',
    name: 'training_circuit_id',
  })
  training_circuit: TrainingCircuit;
}
