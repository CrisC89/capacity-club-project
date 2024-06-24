import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional } from 'class-validator';
import { ExerciseTraining } from 'domain-modules/exercise-training/model';
import { Workout } from 'domain-modules/workout/model';
/**
 * Class used to create training circuit.
 * This class defines the payload used when creating new training circuit.
 */
export class TrainingCircuitCreatePayload {
  @ApiProperty()
  @IsString()
  @Length(1, 50)
  title: string;
  @ApiProperty({ type: () => ExerciseTraining, isArray: true })
  @IsOptional()
  exercise_training_list: ExerciseTraining[];
  @ApiProperty({ type: () => Workout })
  @IsOptional()
  workout: Workout;
}
