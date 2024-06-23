import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length, IsString, IsOptional } from 'class-validator';
import { HomeTraining } from 'domain-modules/home-training/model/entity';
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity';
import { TrainingCircuit } from 'domain-modules/training-circuit/model';

/**
 * Class used to update workout.
 * This class defines the payload used when updating existing workout.
 */
export class WorkoutUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  workout_id: UniqueId;
  @ApiProperty()
  @IsString()
  @Length(1, 50)
  title: string;
  @ApiProperty()
  @IsOptional()
  training_circuits: TrainingCircuit[];
  @ApiProperty()
  @IsOptional()
  home_training: HomeTraining;
  @ApiProperty()
  @IsOptional()
  indoor_training: IndoorTraining;
}
