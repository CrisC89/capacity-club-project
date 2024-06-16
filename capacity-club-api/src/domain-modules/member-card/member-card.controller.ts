import { CrudController } from '@domain-modules-shared';
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import {
  MemberCardCreatePayload,
  MemberCardUpdatePayload,
} from './model/payload';
import { MemberCard } from './model/entity';
import { MemberCardFilter } from './model/filter/member-card.filter';
import {
  MemberCardControllerCreate,
  MemberCardControllerDelete,
  MemberCardControllerDetail,
  MemberCardControllerFilter,
  MemberCardControllerList,
  MemberCardControllerUpdate,
} from '@common/documentation';
import { ApiOperation } from '@nestjs/swagger';
import { MemberCardService } from './member-card.service';

@Controller('member-card')
export class MemberCardController
  implements
    CrudController<
      MemberCard,
      MemberCardCreatePayload,
      MemberCardUpdatePayload,
      MemberCardFilter,
      string
    >
{
  constructor(private readonly service: MemberCardService) {}

  @ApiOperation(MemberCardControllerCreate)
  @Post('create')
  create(@Body() payload: MemberCardCreatePayload): Promise<MemberCard> {
    return this.service.create(payload);
  }

  @ApiOperation(MemberCardControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @ApiOperation(MemberCardControllerDetail)
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<MemberCard> {
    return this.service.detail(id);
  }

  @ApiOperation(MemberCardControllerFilter)
  @Post('filter')
  filter(@Body() filter: MemberCardFilter): Promise<MemberCard[]> {
    return this.service.filter(filter);
  }

  @ApiOperation(MemberCardControllerList)
  @Get('list')
  getAll(): Promise<MemberCard[]> {
    return this.service.getAll();
  }

  @ApiOperation(MemberCardControllerUpdate)
  @Put('update')
  update(@Body() payload: MemberCardUpdatePayload): Promise<MemberCard> {
    return this.service.update(payload);
  }
}
