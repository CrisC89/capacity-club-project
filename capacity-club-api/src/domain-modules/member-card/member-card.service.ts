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
import { Member } from 'domain-modules/member/model';

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
    @InjectRepository(Member)
    private readonly memberRepository: Repository<Member>,
  ) {}
  async getAll(): Promise<MemberCard[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberCardListException();
    }
  }
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
  async detail(id: string): Promise<MemberCard> {
    const result = await this.repository.findOneBy({
      member_card_id: UniqueId.from(id),
    });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberCardNotFoundException();
  }
  async create(payload: MemberCardCreatePayload): Promise<MemberCard> {
    try {
      const created_member_card = Object.assign(
        new MemberCard(),
        Builder<MemberCard>()
          .member_card_id(UniqueId.generate())
          .collective_session_count(payload.collective_session_count)
          .individual_session_count(payload.individual_session_count)
          .member(payload.member)
          .build(),
      );
      return await this.repository.save(created_member_card);
    } catch (e) {
      console.log(e.message);
      throw new MemberCardCreateException();
    }
  }
  async update(payload: MemberCardUpdatePayload): Promise<MemberCard> {
    try {
      const detail: MemberCard = await this.detail(
        payload.member_card_id.toString(),
      );
      detail.collective_session_count = payload.collective_session_count;
      detail.individual_session_count = payload.individual_session_count;
      detail.member = payload.member;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new MemberCardUpdateException();
    }
  }
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberCardDeleteException();
    }
  }
}
