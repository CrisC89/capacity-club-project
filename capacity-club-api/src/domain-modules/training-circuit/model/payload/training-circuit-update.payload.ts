import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString, Length } from 'class-validator';
import { ExerciseTraining } from 'domain-modules/exercise-training/model/entity/exercise-training.entity';

export class TrainingCircuitUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  training_circuit_id: UniqueId;
  @ApiProperty()
  @IsString()
  @Length(1, 50)
  title: string;
  @ApiProperty()
  @IsOptional()
  exercise_training_list: ExerciseTraining[];
}
