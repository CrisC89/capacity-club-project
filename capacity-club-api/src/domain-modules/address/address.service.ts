import { CrudService, Filter } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import {
  Address,
  AddressCreatePayload,
  AddressFilter,
  AddressUpdatePayload,
} from './model';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { ulid } from 'ulid';
import {
  AddressCreateException,
  AddressDeleteException,
  AddressListException,
  AddressNotFoundException,
  AddressUpdateException,
} from './address.exception';
import { isNil } from 'lodash';

@Injectable()
export class AddressService
  implements
    CrudService<
      Address,
      AddressCreatePayload,
      AddressUpdatePayload,
      AddressFilter,
      string
    >
{
  constructor(
    @InjectRepository(Address)
    private readonly repository: Repository<Address>,
  ) {}

  async getAll(): Promise<Address[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new AddressListException();
    }
  }
  filter(filter: AddressFilter): Promise<Address[]> {
    console.log(filter);
    return Promise.resolve([]);
  }
  async detail(id: string): Promise<Address> {
    const result = await this.repository.findOneBy({ address_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new AddressNotFoundException();
  }
  async create(payload: AddressCreatePayload): Promise<Address> {
    try {
      return await this.repository.save(
        Builder<Address>()
          .address_id(ulid())
          .street(payload.street)
          .number(payload.number)
          .zipcode(payload.zipcode)
          .town(payload.town)
          .country(payload.country)
          .complement(payload.complement)
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new AddressCreateException();
    }
  }
  async update(payload: AddressUpdatePayload): Promise<Address> {
    try {
      const detail = await this.detail(payload.address_id);
      detail.street = payload.street;
      detail.number = payload.number;
      detail.zipcode = payload.zipcode;
      detail.town = payload.town;
      detail.country = payload.country;
      detail.complement = payload.complement;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new AddressUpdateException();
    }
  }
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      console.log(e.message);
      throw new AddressDeleteException();
    }
  }
}
