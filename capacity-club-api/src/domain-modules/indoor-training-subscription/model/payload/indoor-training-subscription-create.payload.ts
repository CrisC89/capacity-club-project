import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional } from 'class-validator';
import { IndoorTraining } from 'domain-modules/indoor-training/model';
import { Member } from 'domain-modules/member/model';

export class IndoorTrainingSubscriptionCreatePayload implements Payload {
  @ApiProperty()
  @IsNotEmpty()
  purchase_date: Date;
  @ApiProperty({ type: () => IndoorTraining })
  @IsOptional()
  indoor_training: IndoorTraining;
  @ApiProperty({ type: () => Member })
  @IsOptional()
  member: Member;
}
