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

/**
 * Controller for managing member cards.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating member cards.
 */
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

  /**
   * Endpoint to create a new member card.
   * @param payload - Data for creating a new member card.
   * @returns The created MemberCard.
   */
  @ApiOperation(MemberCardControllerCreate)
  @Post('create')
  create(@Body() payload: MemberCardCreatePayload): Promise<MemberCard> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to delete a member card by ID.
   * @param id - The ID of the member card to delete.
   */
  @ApiOperation(MemberCardControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }

  /**
   * Endpoint to retrieve the details of a member card by ID.
   * @param id - The ID of the member card to retrieve.
   * @returns The found MemberCard.
   */
  @ApiOperation(MemberCardControllerDetail)
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<MemberCard> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to filter member cards based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberCard entries matching the criteria.
   */
  @ApiOperation(MemberCardControllerFilter)
  @Post('filter')
  filter(@Body() filter: MemberCardFilter): Promise<MemberCard[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve all member cards.
   * @returns A list of all MemberCard entries.
   */
  @ApiOperation(MemberCardControllerList)
  @Get('list')
  getAll(): Promise<MemberCard[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to update an existing member card.
   * @param payload - Data for updating the member card.
   * @returns The updated MemberCard.
   */
  @ApiOperation(MemberCardControllerUpdate)
  @Put('update')
  update(@Body() payload: MemberCardUpdatePayload): Promise<MemberCard> {
    return this.service.update(payload);
  }
}
