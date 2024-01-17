import { CrudController, Filter } from '@domain-modules-shared';
import { Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { Address, AddressCreatePayload, AddressUpdatePayload } from './model';
import { AddressService } from './address.service';

@ApiBearerAuth('access-token')
@ApiTags('Address')
@Controller('address')
export class AddressController
  implements
    CrudController<Address, AddressCreatePayload, AddressUpdatePayload, string>
{
  constructor(private readonly service: AddressService) {}

  @Get('list')
  getAll(): Promise<Address[]> {
    return this.service.getAll();
  }
  @Post('filter')
  filter(filter: Filter): Promise<Address[]> {
    return this.service.filter(filter);
  }
  @Get('detail/:id')
  detail(@Param('id') id: string): Promise<Address> {
    return this.service.detail(id);
  }
  @Post('create')
  create(payload: AddressCreatePayload): Promise<Address> {
    return this.service.create(payload);
  }
  @Put('update')
  update(payload: AddressUpdatePayload): Promise<Address> {
    return this.service.update(payload);
  }
  @Delete('delete/:id')
  delete(@Param('id') id: string): Promise<void> {
    return this.service.delete(id);
  }
}
