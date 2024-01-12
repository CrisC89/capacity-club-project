import { BaseEntity, Column, Entity, PrimaryColumn } from 'typeorm';
import { ExerciseDataCategory } from '../enum/exercise-data-category.enum';

@Entity()
export class ExerciseData extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26 })
  exercise_data_id: string;
  @Column({ nullable: false })
  title: string;
  @Column('text', { nullable: true, array: true, default: [] })
  categories: ExerciseDataCategory[];
  @Column('text', { nullable: false, array: true, default: [] })
  description: string[];
  @Column({ nullable: false })
  video_link: string;

  /* @OneToMany(
    () => ExerciseTraining,
    (exerciseTraining) => exerciseTraining.exercise_data,
    {
      cascade: true,
      eager: false,
      nullable: true,
    },
  )
  exercise_training_list: ExerciseTraining[]; */
}
