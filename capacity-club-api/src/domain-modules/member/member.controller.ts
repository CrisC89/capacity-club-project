import {
  Controller,
  Post,
  Body,
  Delete,
  Param,
  Get,
  Put,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { MemberService } from './member.service';
import { Member, MemberCreatePayload, MemberUpdatePayload } from './model';
import { CrudController } from 'domain-modules/shared/model/interface/crud-controller.interface';
import { MemberFilter } from './model/filter';

@ApiBearerAuth('access-token')
@ApiTags('Membre')
@Controller('member')
export class MemberController
  implements
    CrudController<
      Member,
      MemberCreatePayload,
      MemberUpdatePayload,
      MemberFilter,
      string
    >
{
  constructor(private readonly service: MemberService) {}

  @Post('create')
  create(@Body() payload: MemberCreatePayload): Promise<Member> {
    return this.service.create(payload);
  }

  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<Member> {
    return this.service.detail(id);
  }

  @Post('filter')
  filter(@Body() filter: MemberFilter): Promise<Member[]> {
    return this.service.filter(filter);
  }

  @Get('list')
  getAll(): Promise<Member[]> {
    return this.service.getAll();
  }

  @Put('update')
  update(@Body() payload: MemberUpdatePayload): Promise<Member> {
    return this.service.update(payload);
  }
}
