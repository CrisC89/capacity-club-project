import { ApiProperty } from '@nestjs/swagger';
import { Member } from 'domain-modules/member/model';

/**
 * Class used to filter member home training.
 * This class defines the criteria used to filter a list of member home training.
 */
export class MemberHomeTrainingFilter {
  @ApiProperty()
  purchase_date: Date;
  @ApiProperty()
  member: Member;
}
