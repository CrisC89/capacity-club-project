import { Module } from '@nestjs/common';
import { MemberCardService } from './member-card.service';
import { MemberCardController } from './member-card.controller';
import { MemberCard } from './model/entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Member } from 'domain-modules/member/model';

/**
 * Module for managing MemberCard.
 */
@Module({
  imports: [TypeOrmModule.forFeature([MemberCard, Member])],
  providers: [MemberCardService],
  controllers: [MemberCardController],
})
export class MemberCardModule {}
