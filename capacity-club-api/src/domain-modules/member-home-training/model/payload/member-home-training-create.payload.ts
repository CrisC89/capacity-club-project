import { ApiProperty } from '@nestjs/swagger';
import { Member } from 'domain-modules/member/model';

/**
 * Class used to create member home training.
 * This class defines the payload used when creating new member home training.
 */
export class MemberHomeTrainingCreatePayload {
  @ApiProperty()
  purchase_date: Date;
  @ApiProperty()
  member: Member;
}
