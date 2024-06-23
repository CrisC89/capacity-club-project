import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional } from 'class-validator';
import { ExerciseTraining } from 'domain-modules/exercise-training/model';
import { Workout } from 'domain-modules/workout/model';

/**
 * Class used to filter training circuit.
 * This class defines the criteria used to filter a list of exercises.
 */
export class TrainingCircuitFilter {
  @ApiProperty()
  @IsString()
  @IsOptional()
  @Length(1, 50)
  title: string;
  @ApiProperty()
  @IsOptional()
  exercise_training_list: ExerciseTraining[];
  @ApiProperty()
  @IsOptional()
  workout: Workout;
}
