import { CrudService, Filter } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import { MemberSubscription, MemberSubscriptionCreatePayload } from './model';
import { MemberSubscriptionUpdatePayload } from './model/payload/member-subscription-update.payload';
import {
  MemberSubscriptionCreateException,
  MemberSubscriptionDeleteException,
  MemberSubscriptionNotFoundException,
  MemberSubscriptionListException,
  MemberSubscriptionUpdateException,
} from './member-subscription.exception';

@Injectable()
export class MemberSubscriptionService
  implements
    CrudService<
      MemberSubscription,
      MemberSubscriptionCreatePayload,
      MemberSubscriptionUpdatePayload,
      string
    >
{
  constructor(
    @InjectRepository(MemberSubscription)
    private readonly repository: Repository<MemberSubscription>,
  ) {}

  async create(
    payload: MemberSubscriptionCreatePayload,
  ): Promise<MemberSubscription> {
    try {
      return await this.repository.save(
        Builder<MemberSubscription>()
          .start_date(payload.start_date)
          .member_plan(payload.member_plan)
          .member(payload.member)
          .active(payload.active)
          .build(),
      );
    } catch (e) {
      throw new MemberSubscriptionCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberSubscriptionDeleteException();
    }
  }

  async detail(id: string): Promise<MemberSubscription> {
    const result = await this.repository.findOneBy({
      member_subscription_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberSubscriptionNotFoundException();
  }

  filter(filter: Filter): Promise<MemberSubscription[]> {
    console.log(filter);
    return Promise.resolve([]);
  }

  async getAll(): Promise<MemberSubscription[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberSubscriptionListException();
    }
  }

  async update(
    payload: MemberSubscriptionUpdatePayload,
  ): Promise<MemberSubscription> {
    try {
      const detail = await this.detail(payload.member_subscription_id);
      detail.start_date = payload.start_date;
      detail.member = payload.member;
      detail.member_plan = payload.member_plan;
      detail.active = payload.active;
      return await this.repository.save(detail);
    } catch (e) {
      throw new MemberSubscriptionUpdateException();
    }
  }
}
