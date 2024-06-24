import { uniqueIdTransformer, UniqueId } from '@common/model';
import { ApiProperty } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { Workout } from 'domain-modules/workout/model';
import { Entity, BaseEntity, PrimaryColumn, Column, OneToMany } from 'typeorm';

/**
 * Entity representing a home training program.
 * A home training consists of multiple workouts and contains details about the training schedule.
 * It is a training program that the member performs from home or any other place of their choice.
 */
@Entity()
export class HomeTraining extends BaseEntity {
  /**
   * Unique identifier for the home training program.
   * Uses a custom transformer for serialization.
   */
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
  @Column({ nullable: false })
  price: number;

  @OneToMany(() => Workout, (workout) => workout.home_training, {
    cascade: true,
    lazy: true,
  })
  @ApiProperty({ type: () => Workout, isArray: true })
  workouts: Promise<Workout[]>;
}
