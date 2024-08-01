import { Module } from '@nestjs/common';
import { MemberCardService } from './member-card.service';
import { MemberCardController } from './member-card.controller';
import { MemberCard } from './model/entity';
import { TypeOrmModule } from '@nestjs/typeorm';

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
