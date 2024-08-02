import {
  AddressControllerCreate,
  AddressControllerDelete,
  AddressControllerDetail,
  AddressControllerFilter,
  AddressControllerList,
  AddressControllerUpdate,
} from '../../common/documentation/swagger.annotations';
import { CrudController } from '@domain-modules-shared';
import { Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { AddressService } from './address.service';
import { AddressFilter } from './model/filter/address.filter';
import { Address } from './model/entity/address.entity';
import { AddressUpdatePayload } from './model/payload/address-update.payload';
import { AddressCreatePayload } from './model/payload/address-create.payload';

/**
 * Controller for managing addresses.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating addresses.
 */
@ApiBearerAuth('access-token')
@ApiTags('Address')
@Controller('address')
export class AddressController
  implements
    CrudController<
      Address,
      AddressCreatePayload,
      AddressUpdatePayload,
      AddressFilter,
      string
    >
{
  constructor(private readonly service: AddressService) {}

  /**
   * Endpoint to retrieve all addresses.
   * @returns A list of all Address entries.
   */
  @ApiOperation(AddressControllerList)
  @Get('list')
  getAll(): Promise<Address[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to filter addresses based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of Address entries matching the criteria.
   */
  @ApiOperation(AddressControllerFilter)
  @Post('filter')
  filter(filter: AddressFilter): Promise<Address[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve the details of an address by ID.
   * @param id - The ID of the address to retrieve.
   * @returns The found Address.
   */
  @ApiOperation(AddressControllerDetail)
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<Address> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to create a new address.
   * @param payload - Data for creating a new address.
   * @returns The created Address.
   */
  @ApiOperation(AddressControllerCreate)
  @Post('create')
  create(payload: AddressCreatePayload): Promise<Address> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to update an existing address.
   * @param payload - Data for updating the address.
   * @returns The updated Address.
   */
  @ApiOperation(AddressControllerUpdate)
  @Put('update')
  update(payload: AddressUpdatePayload): Promise<Address> {
    return this.service.update(payload);
  }

  /**
   * Endpoint to delete an address by ID.
   * @param id - The ID of the address to delete.
   */
  @ApiOperation(AddressControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }
}
