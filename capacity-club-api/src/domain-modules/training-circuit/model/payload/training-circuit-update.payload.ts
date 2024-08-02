import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString, Length } from 'class-validator';
import { ExerciseTraining } from 'domain-modules/exercise-training/model/entity/exercise-training.entity';
import { Workout } from 'domain-modules/workout/model/entity/workout.entity';

/**
 * Class used to update training circuit.
 * This class defines the payload used when updating existing training circuit.
 */
export class TrainingCircuitUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  training_circuit_id: UniqueId;
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
