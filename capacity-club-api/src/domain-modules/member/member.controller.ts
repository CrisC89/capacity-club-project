import {
  Controller,
  Post,
  Body,
  Delete,
  Param,
  Get,
  Put,
} from '@nestjs/common';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { MemberService } from './member.service';
import { CrudController } from 'domain-modules/shared/model/interface/crud-controller.interface';
import {
  MemberControllerCreate,
  MemberControllerDelete,
  MemberControllerDetail,
  MemberControllerFilter,
  MemberControllerList,
  MemberControllerUpdate,
} from '@common/documentation';
import { Member } from './model/entity/member.entity';
import { MemberFilter } from './model/filter/member.filter';
import { MemberCreatePayload } from './model/payload/member-create.payload';
import { MemberUpdatePayload } from './model/payload/member-update.payload';

/**
 * Controller for managing members.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating members.
 */
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

  /**
   * Endpoint to create a new member.
   * @param payload - Data for creating a new member.
   * @returns The created Member.
   */
  @ApiOperation(MemberControllerCreate)
  @Post('create')
  create(@Body() payload: MemberCreatePayload): Promise<Member> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to delete a member by ID.
   * @param id - The ID of the member to delete.
   */
  @ApiOperation(MemberControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of a member by ID.
   * @param id - The ID of the member to retrieve.
   * @returns The found Member.
   */
  @ApiOperation(MemberControllerDetail)
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<Member> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter members based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of Member entries matching the criteria.
   */
  @ApiOperation(MemberControllerFilter)
  @Post('filter')
  filter(@Body() filter: MemberFilter): Promise<Member[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all members.
   * @returns A list of all Member entries.
   */
  @ApiOperation(MemberControllerList)
  @Get('list')
  getAll(): Promise<Member[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing member.
   * @param payload - Data for updating the member.
   * @returns The updated Member.
   */
  @ApiOperation(MemberControllerUpdate)
  @Put('update')
  update(@Body() payload: MemberUpdatePayload): Promise<Member> {
    return this.service.update(payload);
  }
}
