import { ApiProperty } from '@nestjs/swagger';
import { HomeTraining } from 'domain-modules/home-training/model/entity/home-training.entity';
import { Member } from 'domain-modules/member/model/entity/member.entity';

/**
 * Class used to create member home training.
 * This class defines the payload used when creating new member home training.
 */
export class MemberHomeTrainingCreatePayload {
  @ApiProperty()
  purchase_date: Date;
  @ApiProperty({ type: () => Member })
  member: Member;
  @ApiProperty({ type: () => HomeTraining })
  home_training: HomeTraining;
}
