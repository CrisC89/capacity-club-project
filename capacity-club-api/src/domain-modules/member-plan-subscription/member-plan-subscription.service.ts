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
import { MemberPlanSubscriptionFilter } from './model/filter';

/**
 * Service for managing member plan subscriptions.
 * Implements CRUD operations and filtering for MemberPlanSubscription entities.
 */
@Injectable()
export class MemberPlanSubscriptionService
  implements
    CrudService<
      MemberPlanSubscription,
      MemberPlanSubscriptionCreatePayload,
      MemberPlanSubscriptionUpdatePayload,
      MemberPlanSubscriptionFilter,
      string
    >
{
  constructor(
    @InjectRepository(MemberPlanSubscription)
    private readonly repository: Repository<MemberPlanSubscription>,
  ) {}

  /**
   * Retrieves all member plan subscriptions.
   * @returns A list of all MemberPlanSubscription entries.
   * @throws MemberPlanSubscriptionListException if retrieval fails.
   */
  async getAll(): Promise<MemberPlanSubscription[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberPlanSubscriptionListException();
    }
  }

  /**
   * Filters member plan subscriptions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberPlanSubscription entries matching the criteria.
   */
  filter(
    filter: MemberPlanSubscriptionFilter,
  ): Promise<MemberPlanSubscription[]> {
    const queryBuilder = this.repository.createQueryBuilder(
      'member-plan-subscription',
    );

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`member-plan-subscription.${key} = :${key}`, {
            [key]: value,
          });
        } else {
          queryBuilder.andWhere(
            `member-plan-subscription.${key} LIKE :${key}`,
            {
              [key]: `%${value}%`,
            },
          );
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves the details of a member plan subscription by ID.
   * @param id - The ID of the member plan subscription to retrieve.
   * @returns The found MemberPlanSubscription.
   * @throws MemberPlanSubscriptionNotFoundException if the subscription is not found.
   */
  async detail(id: string): Promise<MemberPlanSubscription> {
    const result = await this.repository.findOneBy({
      member_plan_subscription_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberPlanSubscriptionNotFoundException();
  }

  /**
   * Creates a new member plan subscription.
   * @param payload - Data for creating a new member plan subscription.
   * @returns The created MemberPlanSubscription.
   * @throws MemberPlanSubscriptionCreateException if creation fails.
   */
  async create(
    payload: MemberPlanSubscriptionCreatePayload,
  ): Promise<MemberPlanSubscription> {
    try {
      return await this.repository.save(
        Builder<MemberPlanSubscription>()
          .member_plan_subscription_id(UniqueId.generate())
          .purchase_date(payload.purchase_date)
          .member_plan(payload.member_plan)
          .member(payload.member)
          .member_card(payload.member_card)
          .build(),
      );
    } catch (e) {
      throw new MemberPlanSubscriptionCreateException();
    }
  }

  /**
   * Updates an existing member plan subscription.
   * @param payload - Data for updating the subscription.
   * @returns The updated MemberPlanSubscription.
   * @throws MemberPlanSubscriptionUpdateException if update fails.
   */
  async update(
    payload: MemberPlanSubscriptionUpdatePayload,
  ): Promise<MemberPlanSubscription> {
    try {
      const detail = await this.detail(
        payload.member_plan_subscription_id.toString(),
      );
      detail.purchase_date = payload.purchase_date;
      detail.member = payload.member;
      detail.member_plan = payload.member_plan;
      detail.member_card = payload.member_card;
      return await this.repository.save(detail);
    } catch (e) {
      throw new MemberPlanSubscriptionUpdateException();
    }
  }

  /**
   * Deletes an existing member plan subscription by ID.
   * @param id - The ID of the subscription to delete.
   * @throws MemberPlanSubscriptionDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberPlanSubscriptionDeleteException();
    }
  }
}
