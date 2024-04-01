import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { CollectiveTrainingSession } from 'domain-modules/collective-training-session/model';
import { Member } from 'domain-modules/member/model';
import { Workout } from 'domain-modules/workout/model';

export class CollectiveTrainingUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  collective_training_id: UniqueId;

  @ApiProperty()
  @IsNotEmpty()
  member: Member;

  @ApiProperty()
  @IsNotEmpty()
  collective_training_session: CollectiveTrainingSession;

  @ApiProperty()
  @IsNotEmpty()
  workout: Workout;
}
