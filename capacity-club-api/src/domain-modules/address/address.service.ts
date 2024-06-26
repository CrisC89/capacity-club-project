import { CrudService } from '@domain-modules-shared';
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
import {
  AddressCreateException,
  AddressDeleteException,
  AddressListException,
  AddressNotFoundException,
  AddressUpdateException,
} from './address.exception';
import { isNil } from 'lodash';
import { UniqueId } from '@common/model/unique-id';

/**
 * Service for managing addresses.
 * Implements CRUD operations and filtering for Address entities.
 */
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

  /**
   * Retrieves all addresses.
   * @returns A list of all Address entries.
   * @throws AddressListException if retrieval fails.
   */
  async getAll(): Promise<Address[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new AddressListException();
    }
  }

  /**
   * Filters addresses based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of Address entries matching the criteria.
   */
  filter(filter: AddressFilter): Promise<Address[]> {
    const queryBuilder = this.repository.createQueryBuilder('address');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`address.${key} = :${key}`, {
            [key]: value,
          });
        } else {
          queryBuilder.andWhere(`address.${key} LIKE :${key}`, {
            [key]: `%${value}%`,
          });
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves the details of an address by ID.
   * @param id - The ID of the address to retrieve.
   * @returns The found Address.
   * @throws AddressNotFoundException if the address is not found.
   */
  async detail(id: string): Promise<Address> {
    const result = await this.repository.findOneBy({ address_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new AddressNotFoundException();
  }

  /**
   * Creates a new address.
   * @param payload - Data for creating a new address.
   * @returns The created Address.
   * @throws AddressCreateException if creation fails.
   */
  async create(payload: AddressCreatePayload): Promise<Address> {
    try {
      return await this.repository.save(
        Builder<Address>()
          .address_id(UniqueId.generate())
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

  /**
   * Updates an existing address.
   * @param payload - Data for updating the address.
   * @returns The updated Address.
   * @throws AddressUpdateException if update fails.
   */
  async update(payload: AddressUpdatePayload): Promise<Address> {
    try {
      const detail = await this.detail(payload.address_id.toString());
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

  /**
   * Deletes an existing address by ID.
   * @param id - The ID of the address to delete.
   * @throws AddressDeleteException if deletion fails.
   */
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
