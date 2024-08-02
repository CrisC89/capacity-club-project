import { UniqueId } from '@common/model';
import { Payload } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, Length } from 'class-validator';
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity/indoor-training.entity';
import { Member } from 'domain-modules/member/model/entity/member.entity';

export class IndoorTrainingSubscriptionUpdatePayload implements Payload {
  @ApiProperty()
  @IsNotEmpty()
  @Length(26, 26)
  indoor_training_subscription_id: UniqueId;
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
