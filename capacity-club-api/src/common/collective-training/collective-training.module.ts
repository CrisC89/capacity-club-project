import { Module } from '@nestjs/common';
import { CollectiveTrainingService } from './collective-training.service';
import { CollectiveTrainingController } from './collective-training.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CollectiveTraining } from './model';

@Module({
  imports: [TypeOrmModule.forFeature([CollectiveTraining])],
  providers: [CollectiveTrainingService],
  controllers: [CollectiveTrainingController],
})
export class CollectiveTrainingModule {}
