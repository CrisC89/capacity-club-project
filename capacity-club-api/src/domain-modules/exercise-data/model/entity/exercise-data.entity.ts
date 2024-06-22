import { BaseEntity, Column, Entity, OneToMany, PrimaryColumn } from 'typeorm';
import { ExerciseDataCategory } from '../enum/exercise-data-category.enum';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { ExerciseTraining } from 'domain-modules/exercise-training/model';

@Entity()
export class ExerciseData extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  exercise_data_id: UniqueId;
  @Column({ nullable: false })
  title: string;
  @Column('text', { nullable: true, array: true, default: [] })
  categories: ExerciseDataCategory[];
  @Column('text', { nullable: false, array: true, default: [] })
  description: string[];
  @Column({ nullable: true })
  video_youtube_link: string;
  @Column({ nullable: true })
  video_asset_link: string;
  @OneToMany(
    () => ExerciseTraining,
    (exerciseTraining) => exerciseTraining.exercise_data,
    {
      cascade: true,
      eager: false,
      nullable: true,
    },
  )
  exercise_training_list: ExerciseTraining[];
}
