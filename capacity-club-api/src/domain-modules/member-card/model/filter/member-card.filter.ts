import { ApiProperty } from '@nestjs/swagger';
import { Member } from 'domain-modules/member/model';

export class MemberCardFilter {
  @ApiProperty()
  collective_session_count: number;

  @ApiProperty()
  individual_session_count: number;

  @ApiProperty()
  Member: Member;
}
