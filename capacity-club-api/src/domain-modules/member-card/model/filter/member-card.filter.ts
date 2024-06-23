import { ApiProperty } from '@nestjs/swagger';
import { Member } from 'domain-modules/member/model';

/**
 * Class used to filter member card.
 * This class defines the criteria used to filter a list of member card.
 */
export class MemberCardFilter {
  @ApiProperty()
  collective_session_count: number;

  @ApiProperty()
  individual_session_count: number;

  @ApiProperty()
  Member: Member;
}
