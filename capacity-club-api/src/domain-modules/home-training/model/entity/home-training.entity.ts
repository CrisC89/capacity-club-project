import { uniqueIdTransformer, UniqueId, BaseEntity } from '@common/model';
import { ApiProperty } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { MemberHomeTraining } from 'domain-modules/member-home-training/model/entity/member_home_training.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';
import { Entity, PrimaryColumn, Column, OneToMany } from 'typeorm';

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
  @Column({ nullable: true })
  description: string;
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

  @OneToMany(
    () => MemberHomeTraining,
    (member_home_training) => member_home_training.home_training,
    {
      cascade: true,
      lazy: true,
    },
  )
  @ApiProperty({ type: () => MemberHomeTraining, isArray: true })
  member_home_trainings: Promise<MemberHomeTraining[]>;
}
