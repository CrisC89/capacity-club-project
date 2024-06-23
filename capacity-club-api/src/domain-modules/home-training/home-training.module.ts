import { Module } from '@nestjs/common';
import { HomeTrainingController } from './home-training.controller';
import { HomeTrainingService } from './home-training.service';

@Module({
  controllers: [HomeTrainingController],
  providers: [HomeTrainingService]
})
export class HomeTrainingModule {}
