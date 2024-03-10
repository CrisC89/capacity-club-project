import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { Member } from 'domain-modules/member/model';
import { Workout } from 'domain-modules/workout/model';

export class PersonnalTrainingFilter {
  @ApiProperty()
  @IsNotEmpty()
  title: string;
  @ApiProperty()
  @IsNotEmpty()
  training_start_date: Date;
  @ApiProperty()
  @IsNotEmpty()
  training_end_date: Date;

  @ApiProperty()
  @IsNotEmpty()
  member: Member;
  @ApiProperty()
  @IsNotEmpty()
  workouts: Workout[];
}
