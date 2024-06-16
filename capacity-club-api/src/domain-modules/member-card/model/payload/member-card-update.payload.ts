import { UniqueId } from '@common/model/unique-id';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { Member } from 'domain-modules/member/model';

export class MemberCardUpdatePayload {
  @ApiProperty()
  @IsNotEmpty()
  member_card_id: UniqueId;
  @ApiProperty()
  collective_session_count: number;

  @ApiProperty()
  individual_session_count: number;

  @ApiProperty()
  member: Member;
}
