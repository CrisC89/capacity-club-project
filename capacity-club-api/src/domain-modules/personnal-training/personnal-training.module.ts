import { Module } from '@nestjs/common';
import { PersonnalTrainingService } from './personnal-training.service';
import { PersonnalTrainingController } from './personnal-training.controller';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([])],
  providers: [PersonnalTrainingService],
  controllers: [PersonnalTrainingController],
})
export class PersonnalTrainingModule {}
