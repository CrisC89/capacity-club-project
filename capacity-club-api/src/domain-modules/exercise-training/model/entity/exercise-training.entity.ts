import { BaseEntity } from '@common/model';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';
import { PrimaryColumn, Column, ManyToOne, JoinColumn, Entity } from 'typeorm';
import { TrainingIntensity } from '../enum';
import { ExerciseData } from 'domain-modules/exercise-data/model';

@Entity()
export class ExerciseTraining extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26 })
  exercise_training_id: string;
  @Column({ nullable: false })
  title: string;
  @Column({ nullable: false })
  nb_reps: number;
  @Column('varchar', { nullable: false, default: TrainingIntensity.RPE })
  intensity: TrainingIntensity;
  @Column({ nullable: true })
  member_feedback: number;
  @Column({ nullable: true })
  member_note: string;

  @ManyToOne(() => ExerciseData)
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
