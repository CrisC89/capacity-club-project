import { Module } from '@nestjs/common';
import { IndoorTrainingService } from './indoor-training.service';
import { IndoorTrainingController } from './indoor-training.controller';

@Module({
  providers: [IndoorTrainingService],
  controllers: [IndoorTrainingController],
})
export class IndoorTrainingModule {}