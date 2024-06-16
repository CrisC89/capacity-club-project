import {
  AddressControllerCreate,
  AddressControllerDelete,
  AddressControllerDetail,
  AddressControllerFilter,
  AddressControllerList,
  AddressControllerUpdate,
} from './../../common/documentation/swagger.annotations';
import { CrudController } from '@domain-modules-shared';
import { Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { Address, AddressCreatePayload, AddressUpdatePayload } from './model';
import { AddressService } from './address.service';
import { AddressFilter } from './model/filter/address.filter';

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

  @ApiOperation(AddressControllerList)
  @Get('list')
  getAll(): Promise<Address[]> {
    return this.service.getAll();
  }
  @ApiOperation(AddressControllerFilter)
  @Post('filter')
  filter(filter: AddressFilter): Promise<Address[]> {
    return this.service.filter(filter);
  }
  @ApiOperation(AddressControllerDetail)
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<Address> {
    return this.service.detail(id);
  }
  @ApiOperation(AddressControllerCreate)
  @Post('create')
  create(payload: AddressCreatePayload): Promise<Address> {
    return this.service.create(payload);
  }
  @ApiOperation(AddressControllerUpdate)
  @Put('update')
  update(payload: AddressUpdatePayload): Promise<Address> {
    return this.service.update(payload);
  }
  @ApiOperation(AddressControllerDelete)
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }
}
