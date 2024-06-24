import { Injectable } from '@nestjs/common';
import { MemberCard } from './model/entity';
import {
  MemberCardCreatePayload,
  MemberCardUpdatePayload,
} from './model/payload';
import { MemberCardFilter } from './model/filter/member-card.filter';
import { CrudService } from '@domain-modules-shared';
import { UniqueId } from '@common/model/unique-id';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import {
  MemberCardCreateException,
  MemberCardDeleteException,
  MemberCardListException,
  MemberCardNotFoundException,
  MemberCardUpdateException,
} from './member-card.exception';
import { isNil } from 'lodash';

/**
 * Service for managing member cards.
 * Implements CRUD operations and filtering for MemberCard entities.
 */
@Injectable()
export class MemberCardService
  implements
    CrudService<
      MemberCard,
      MemberCardCreatePayload,
      MemberCardUpdatePayload,
      MemberCardFilter,
      string
    >
{
  constructor(
    @InjectRepository(MemberCard)
    private readonly repository: Repository<MemberCard>,
  ) {}
  /**
   * Retrieves all member cards.
   * @returns A list of all MemberCard entries.
   * @throws MemberCardListException if retrieval fails.
   */
  async getAll(): Promise<MemberCard[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberCardListException();
    }
  }

  /**
   * Filters member cards based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberCard entries matching the criteria.
   */
  filter(filter: MemberCardFilter): Promise<MemberCard[]> {
    const queryBuilder = this.repository.createQueryBuilder('member-card');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`member-card.${key} = :${key}`, {
            [key]: value,
          });
        } else {
          queryBuilder.andWhere(`member-card.${key} LIKE :${key}`, {
            [key]: `%${value}%`,
          });
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves the details of a member card by ID.
   * @param id - The ID of the member card to retrieve.
   * @returns The found MemberCard.
   * @throws MemberCardNotFoundException if the member card is not found.
   */
  async detail(id: string): Promise<MemberCard> {
    const result = await this.repository.findOneBy({
      member_card_id: UniqueId.from(id),
    });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberCardNotFoundException();
  }

  /**
   * Creates a new member card.
   * @param payload - Data for creating a new member card.
   * @returns The created MemberCard.
   * @throws MemberCardCreateException if creation fails.
   */
  async create(payload: MemberCardCreatePayload): Promise<MemberCard> {
    try {
      const created_member_card = Object.assign(
        new MemberCard(),
        Builder<MemberCard>()
          .member_card_id(UniqueId.generate())
          .collective_session_count(payload.collective_session_count)
          .individual_session_count(payload.individual_session_count)
          .build(),
      );
      return await this.repository.save(created_member_card);
    } catch (e) {
      console.log(e.message);
      throw new MemberCardCreateException();
    }
  }

  /**
   * Updates an existing member card.
   * @param payload - Data for updating the member card.
   * @returns The updated MemberCard.
   * @throws MemberCardUpdateException if update fails.
   */
  async update(payload: MemberCardUpdatePayload): Promise<MemberCard> {
    try {
      const detail: MemberCard = await this.detail(
        payload.member_card_id.toString(),
      );
      detail.collective_session_count = payload.collective_session_count;
      detail.individual_session_count = payload.individual_session_count;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new MemberCardUpdateException();
    }
  }

  /**
   * Deletes an existing member card by ID.
   * @param id - The ID of the member card to delete.
   * @throws MemberCardDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberCardDeleteException();
    }
  }
}
