import { CrudService } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import {
  MemberPlanSubscription,
  MemberPlanSubscriptionCreatePayload,
  MemberPlanSubscriptionUpdatePayload,
} from './model';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import {
  MemberPlanSubscriptionCreateException,
  MemberPlanSubscriptionDeleteException,
  MemberPlanSubscriptionListException,
  MemberPlanSubscriptionNotFoundException,
  MemberPlanSubscriptionUpdateException,
} from './member-plan-subscription.exception';
import { isNil } from 'lodash';
import { UniqueId } from '@common/model/unique-id';

@Injectable()
export class MemberPlanSubscriptionService
  implements
    CrudService<
      MemberPlanSubscription,
      MemberPlanSubscriptionCreatePayload,
      MemberPlanSubscriptionUpdatePayload,
      MemberPlanSubscription,
      string
    >
{
  constructor(
    @InjectRepository(MemberPlanSubscription)
    private readonly repository: Repository<MemberPlanSubscription>,
  ) {}

  async getAll(): Promise<MemberPlanSubscription[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberPlanSubscriptionListException();
    }
  }

  filter(filter: MemberPlanSubscription): Promise<MemberPlanSubscription[]> {
    console.log(filter);
    return Promise.resolve([]);
  }
  async detail(id: string): Promise<MemberPlanSubscription> {
    const result = await this.repository.findOneBy({
      member_plan_subscription_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberPlanSubscriptionNotFoundException();
  }
  async create(
    payload: MemberPlanSubscriptionCreatePayload,
  ): Promise<MemberPlanSubscription> {
    try {
      return await this.repository.save(
        Builder<MemberPlanSubscription>()
          .member_plan_subscription_id(UniqueId.generate())
          .start_date(payload.start_date)
          .member_plan(payload.member_plan)
          .member(payload.member)
          .active(payload.active)
          .build(),
      );
    } catch (e) {
      throw new MemberPlanSubscriptionCreateException();
    }
  }
  async update(
    payload: MemberPlanSubscriptionUpdatePayload,
  ): Promise<MemberPlanSubscription> {
    try {
      const detail = await this.detail(
        payload.member_plan_subscription_id.toString(),
      );
      detail.start_date = payload.start_date;
      detail.member = payload.member;
      detail.member_plan = payload.member_plan;
      detail.active = payload.active;
      return await this.repository.save(detail);
    } catch (e) {
      throw new MemberPlanSubscriptionUpdateException();
    }
  }
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberPlanSubscriptionDeleteException();
    }
  }
}
