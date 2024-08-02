import { ApiProperty } from '@nestjs/swagger';

/**
 * Class used to create member card.
 * This class defines the payload used when creating new member card.
 */
export class MemberCardCreatePayload {
  @ApiProperty()
  collective_session_count: number;

  @ApiProperty()
  individual_session_count: number;
}
