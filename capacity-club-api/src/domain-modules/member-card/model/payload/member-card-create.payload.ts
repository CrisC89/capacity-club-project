import { ApiProperty } from '@nestjs/swagger';
import { Member } from 'domain-modules/member/model';

/**
 * Class used to create member card.
 * This class defines the payload used when creating new member card.
 */
export class MemberCardCreatePayload {
  @ApiProperty()
  collective_session_count: number;

  @ApiProperty()
  individual_session_count: number;

  @ApiProperty()
  member: Member;
}
