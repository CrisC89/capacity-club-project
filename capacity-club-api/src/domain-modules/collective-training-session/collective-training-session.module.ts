import { Module } from '@nestjs/common';
import { CollectiveTrainingSessionService } from './collective-training-session.service';
import { CollectiveTrainingSessionController } from './collective-training-session.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CollectiveTrainingSession } from './model';

@Module({
  imports: [TypeOrmModule.forFeature([CollectiveTrainingSession])],
  providers: [CollectiveTrainingSessionService],
  controllers: [CollectiveTrainingSessionController],
})
export class CollectiveTrainingSessionModule {}
