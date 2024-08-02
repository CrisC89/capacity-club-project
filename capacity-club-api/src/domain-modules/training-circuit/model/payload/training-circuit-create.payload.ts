import { ApiProperty } from '@nestjs/swagger';
import { IsString, Length, IsOptional, IsNotEmpty } from 'class-validator';
import { ExerciseTraining } from 'domain-modules/exercise-training/model/entity/exercise-training.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';

/**
 * Class used to create training circuit.
 * This class defines the payload used when creating new training circuit.
 */
export class TrainingCircuitCreatePayload {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @Length(1, 50)
  title: string;
  @ApiProperty({ type: () => ExerciseTraining, isArray: true })
  @IsOptional()
  exercise_training_list: ExerciseTraining[];
  @ApiProperty({ type: () => Workout })
  @IsOptional()
  workout: Workout;
}
