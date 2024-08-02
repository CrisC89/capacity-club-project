import { Module } from '@nestjs/common';
import { MemberCardService } from './member-card.service';
import { MemberCardController } from './member-card.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberCard } from './model/entity/member-card.entity';

/**
 * Module for managing MemberCard.
 */
@Module({
  imports: [TypeOrmModule.forFeature([MemberCard])],
  providers: [MemberCardService],
  controllers: [MemberCardController],
  exports: [MemberCardService],
})
export class MemberCardModule {}
