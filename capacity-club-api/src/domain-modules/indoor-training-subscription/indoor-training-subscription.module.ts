import { Module } from '@nestjs/common';
import { IndoorTrainingSubscriptionController } from './indoor-training-subscription.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { IndoorTrainingSubscription } from './model';
import { IndoorTraining } from 'domain-modules/indoor-training/model';
import { Member } from 'domain-modules/member/model';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      IndoorTrainingSubscription,
      IndoorTraining,
      Member,
    ]),
  ],
  providers: [],
  controllers: [IndoorTrainingSubscriptionController],
})
export class IndoorTrainingSubscriptionModule {}
