import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MemberSubscriptionController } from './member-subscription.controller';
import { MemberSubscriptionService } from './member-subscription.service';
import { MemberSubscription } from './model';

@Module({
  imports: [TypeOrmModule.forFeature([MemberSubscription])],
  controllers: [MemberSubscriptionController],
  providers: [MemberSubscriptionService],
})
export class MemberSubscriptionModule {}
