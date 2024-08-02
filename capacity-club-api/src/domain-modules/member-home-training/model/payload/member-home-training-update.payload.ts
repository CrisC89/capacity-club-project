import { UniqueId } from '@common/model';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, Length } from 'class-validator';
import { HomeTraining } from 'domain-modules/home-training/model/entity/home-training.entity';
import { Member } from 'domain-modules/member/model/entity/member.entity';

/**
 * Class used to update  member home training.
 * This class defines the payload used when updating existing  member home training.
 */
export class MemberHomeTrainingUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  member_home_training_id: UniqueId;
  @ApiProperty()
  purchase_date: Date;
  @ApiProperty({ type: () => Member })
  member: Member;
  @ApiProperty({ type: () => HomeTraining })
  home_training: HomeTraining;
}
