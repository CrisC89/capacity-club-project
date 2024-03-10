import { ApiProperty } from '@nestjs/swagger';

export class CollectiveTrainingSessionFilter {
  @ApiProperty()
  title: string;
  @ApiProperty()
  training_date: Date;
  @ApiProperty()
  start_hours: string;
  @ApiProperty()
  end_hours: string;
  @ApiProperty()
  nb_place: number;
}
