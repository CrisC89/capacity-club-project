import { CrudService } from '@domain-modules-shared';
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { Brackets, Repository } from 'typeorm';
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
import { MemberService } from 'domain-modules/member/member.service';
import { MemberPlanService } from 'domain-modules/member-plan/member-plan.service';
import { MemberCardService } from 'domain-modules/member-card/member-card.service';
import { MemberPlanSubscriptionUpdatePayload } from './model/payload/member-plan-subscription-update.payload';
import { MemberPlanSubscription } from './model/entity/member-plan-subscription.entity';
import { MemberPlanSubscriptionCreatePayload } from './model/payload/member-plan-subscription-create.payload';
import { MemberPlanSubscriptionFilter } from './model/filter/member-plan-subscription.filter';

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
    @Inject(forwardRef(() => MemberService))
    private readonly member_service: MemberService,
    @Inject(forwardRef(() => MemberPlanService))
    private readonly member_plan_service: MemberPlanService,
    @Inject(forwardRef(() => MemberCardService))
    private readonly member_card_service: MemberCardService,
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
  async filter(
    filter: MemberPlanSubscriptionFilter,
  ): Promise<MemberPlanSubscription[]> {
    const queryBuilder = this.repository.createQueryBuilder(
      'member-plan-subscription',
    );

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'purchase_date':
            const date = new Date(value);
            const year: number = date.getUTCFullYear();
            const month: number = date.getUTCMonth() + 1;
            const day: number = date.getUTCDate();

            queryBuilder.andWhere(
              new Brackets((qb) => {
                qb.where(
                  `CAST(EXTRACT(YEAR FROM "member-plan-subscription"."purchase_date") AS int) = :year`,
                  { year },
                )
                  .andWhere(
                    `CAST(EXTRACT(MONTH FROM "member-plan-subscription"."purchase_date") AS int) = :month`,
                    { month },
                  )
                  .andWhere(
                    `CAST(EXTRACT(DAY FROM "member-plan-subscription"."purchase_date") AS int) = :day`,
                    { day },
                  );
              }),
            );
            break;
          case 'member':
            queryBuilder.andWhere('member-plan-subscription.member = :member', {
              member: value,
            });
            break;
          case 'member_plan':
            queryBuilder.andWhere(
              'member-plan-subscription.member_plan = :member_plan',
              { member_plan: value },
            );
            break;
          case 'member_card':
            queryBuilder.andWhere(
              'member-plan-subscription.member_card = :member_card',
              { member_card: value },
            );
            break;
          default:
            break;
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
      let resolvedMemberPlan;
      try {
        resolvedMemberPlan = await this.member_plan_service.detail(
          payload.member_plan.member_plan_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving member plan:', e.message);
        resolvedMemberPlan = null;
      }

      let resolvedMember;
      try {
        resolvedMember = await this.member_service.detail(
          payload.member.member_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving member:', e.message);
        resolvedMember = null;
      }

      let resolvedMemberCard;
      try {
        resolvedMemberCard = await this.member_card_service.detail(
          payload.member_card.member_card_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving member card:', e.message);
        resolvedMemberCard = null;
      }

      return await this.repository.save(
        Builder<MemberPlanSubscription>()
          .member_plan_subscription_id(UniqueId.generate())
          .purchase_date(payload.purchase_date)
          .member_plan(resolvedMemberPlan)
          .member(Promise.resolve(resolvedMember))
          .member_card(resolvedMemberCard)
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

      let resolvedMemberPlan;
      try {
        resolvedMemberPlan = await this.member_plan_service.detail(
          payload.member_plan.member_plan_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving member plan:', e.message);
        resolvedMemberPlan = null;
      }

      let resolvedMember;
      try {
        resolvedMember = await this.member_service.detail(
          payload.member.member_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving member:', e.message);
        resolvedMember = null;
      }

      let resolvedMemberCard;
      try {
        resolvedMemberCard = await this.member_card_service.detail(
          payload.member_card.member_card_id.toString(),
        );
      } catch (e) {
        console.log('Error resolving member card:', e.message);
        resolvedMemberCard = null;
      }

      detail.purchase_date = payload.purchase_date;
      detail.member = Promise.resolve(resolvedMember);
      detail.member_plan = resolvedMemberPlan;
      detail.member_card = resolvedMemberCard;
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
