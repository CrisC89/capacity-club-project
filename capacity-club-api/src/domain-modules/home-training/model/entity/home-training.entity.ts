import { uniqueIdTransformer, UniqueId } from '@common/model';
import { Transform } from 'class-transformer';
import { Workout } from 'domain-modules/workout/model';
import { Entity, BaseEntity, PrimaryColumn, Column, OneToMany } from 'typeorm';

@Entity()
export class HomeTraining extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  home_training_id: UniqueId;
  @Column({ nullable: false })
  title: string;
  @Column({ nullable: false })
  nb_week: number;
  @Column({ nullable: false })
  nb_training_by_week: number;

  @OneToMany(() => Workout, (workout) => workout.home_training, {
    cascade: true,
    eager: true,
  })
  workouts: Workout[];
}
