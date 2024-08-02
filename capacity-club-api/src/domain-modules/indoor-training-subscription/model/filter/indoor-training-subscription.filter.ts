import { Filter } from '@domain-modules-shared';
import { ApiProperty } from '@nestjs/swagger';
import { IsOptional } from 'class-validator';
import { IndoorTraining } from 'domain-modules/indoor-training/model/entity/indoor-training.entity';
import { Member } from 'domain-modules/member/model/entity/member.entity';

export class IndoorTrainingSubscriptionFilter implements Filter {
  @ApiProperty()
  @IsOptional()
  purchase_date: Date;
  @ApiProperty({ type: () => IndoorTraining })
  @IsOptional()
  indoor_training: IndoorTraining;
  @ApiProperty({ type: () => Member })
  @IsOptional()
  member: Member;
}
