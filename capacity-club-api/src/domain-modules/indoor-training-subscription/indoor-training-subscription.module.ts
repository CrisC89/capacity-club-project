import { forwardRef, Module } from '@nestjs/common';
import { IndoorTrainingSubscriptionController } from './indoor-training-subscription.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { IndoorTrainingSubscriptionService } from './indoor-training-subscription.service';
import { IndoorTrainingModule } from 'domain-modules/indoor-training/indoor-training.module';
import { MemberModule } from 'domain-modules/member/member.module';
import { IndoorTrainingSubscription } from './model/entity/indoor-training-subscription.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([IndoorTrainingSubscription]),
    forwardRef(() => IndoorTrainingModule),
    forwardRef(() => MemberModule),
  ],
  providers: [IndoorTrainingSubscriptionService],
  controllers: [IndoorTrainingSubscriptionController],
  exports: [IndoorTrainingSubscriptionService],
})
export class IndoorTrainingSubscriptionModule {}
