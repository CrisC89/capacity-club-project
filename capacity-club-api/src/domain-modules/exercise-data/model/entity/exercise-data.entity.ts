import { ApiProperty } from '@nestjs/swagger';
import { BaseEntity, Column, Entity, OneToMany, PrimaryColumn } from 'typeorm';
import { ExerciseDataCategory } from '../enum/exercise-data-category.enum';
import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { ExerciseTraining } from 'domain-modules/exercise-training/model';

/**
 * Entity representing exercise data.
 * This entity holds the basic information of exercises, which can be reused and adapted by coaches
 * to create specific exercise programs. Coaches can refer to this data to avoid repeating the content
 * of an exercise and adapt details like the number of repetitions in ExerciseTraining.
 */
@Entity()
export class ExerciseData extends BaseEntity {
  /**
   * Unique identifier for the exercise data.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  exercise_data_id: UniqueId;
  @Column({ nullable: false })
  title: string;
  @Column('text', { nullable: false, array: true, default: [] })
  description: string[];
  @Column('text', { nullable: true, array: true, default: [] })
  categories: ExerciseDataCategory[];
  @Column({ nullable: true })
  video_youtube_link: string;
  @Column({ nullable: true })
  video_asset_link: string;
  @OneToMany(
    () => ExerciseTraining,
    (exerciseTraining) => exerciseTraining.exercise_data,
    {
      cascade: true,
      lazy: true,
      nullable: true,
    },
  )
  @ApiProperty({ type: () => ExerciseTraining, isArray: true })
  exercise_training_list: Promise<ExerciseTraining[]>;
}
