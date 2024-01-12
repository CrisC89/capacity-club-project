import { Controller } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

@ApiBearerAuth('access-token')
@ApiTags('Entrainement personnel')
@Controller('personnal-training')
export class PersonnalTrainingController {}
