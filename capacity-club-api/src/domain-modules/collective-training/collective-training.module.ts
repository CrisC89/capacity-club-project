import { Module } from '@nestjs/common';
import { CollectiveTrainingController } from './collective-training.controller';
import { CollectiveTrainingService } from './collective-training.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CollectiveTraining } from './model';

@Module({
  imports: [TypeOrmModule.forFeature([CollectiveTraining])],
  controllers: [CollectiveTrainingController],
  providers: [CollectiveTrainingService],
})
export class CollectiveTrainingModule {}
