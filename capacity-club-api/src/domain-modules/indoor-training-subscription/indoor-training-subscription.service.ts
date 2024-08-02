import { CrudService } from '@domain-modules-shared';
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Brackets, Repository } from 'typeorm';
import {
  IndoorTrainingSubscriptionCreateException,
  IndoorTrainingSubscriptionDeleteException,
  IndoorTrainingSubscriptionListException,
  IndoorTrainingSubscriptionNotFoundException,
  IndoorTrainingSubscriptionUpdateException,
} from './indoor-training-subscription.exception';
import { isNil } from 'lodash';
import { UniqueId } from '@common/model';
import { Builder } from 'builder-pattern';
import { MemberService } from 'domain-modules/member/member.service';
import { IndoorTrainingService } from 'domain-modules/indoor-training/indoor-training.service';
import { IndoorTrainingSubscription } from './model/entity/indoor-training-subscription.entity';
import { IndoorTrainingSubscriptionFilter } from './model/filter/indoor-training-subscription.filter';
import { IndoorTrainingSubscriptionCreatePayload } from './model/payload/indoor-training-subscription-create.payload';
import { IndoorTrainingSubscriptionUpdatePayload } from './model/payload/indoor-training-subscription-update.payload';

/**
 * Service for managing indoor training sessions.
 * Implements CRUD operations and filtering for IndoorTraining entities.
 */
@Injectable()
export class IndoorTrainingSubscriptionService
  implements
    CrudService<
      IndoorTrainingSubscription,
      IndoorTrainingSubscriptionCreatePayload,
      IndoorTrainingSubscriptionUpdatePayload,
      IndoorTrainingSubscriptionFilter,
      string
    >
{
  constructor(
    @InjectRepository(IndoorTrainingSubscription)
    private readonly repository: Repository<IndoorTrainingSubscription>,
    @Inject(forwardRef(() => MemberService))
    private readonly member_service: MemberService,
    @Inject(forwardRef(() => IndoorTrainingService))
    private readonly indoor_training_service: IndoorTrainingService,
  ) {}

  /**
   * Retrieves all indoor training sessions.
   * @returns A list of all IndoorTraining entries.
   * @throws IndoorTrainingListException if retrieval fails.
   */
  async getAll(): Promise<IndoorTrainingSubscription[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new IndoorTrainingSubscriptionListException();
    }
  }

  /**
   * Filters indoor training sessions based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of IndoorTraining entries matching the criteria.
   */
  async filter(
    filter: IndoorTrainingSubscriptionFilter,
  ): Promise<IndoorTrainingSubscription[]> {
    const queryBuilder = this.repository.createQueryBuilder(
      'indoorTrainingSubscription',
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
                  `CAST(EXTRACT(YEAR FROM "indoor-training-subscription"."purchase_date") AS int) = :year`,
                  { year },
                )
                  .andWhere(
                    `CAST(EXTRACT(MONTH FROM "indoor-training-subscription"."purchase_date") AS int) = :month`,
                    { month },
                  )
                  .andWhere(
                    `CAST(EXTRACT(DAY FROM "indoor-training-subscription"."purchase_date") AS int) = :day`,
                    { day },
                  );
              }),
            );
            break;
          case 'indoor_training':
            queryBuilder.andWhere(
              'indoor-training-subscription.indoor_training = :indoor_training',
              { indoor_training: value },
            );
            break;
          case 'member':
            queryBuilder.andWhere(
              'indoor-training-subscription.member = :member',
              { member: value },
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
   * Retrieves the details of an indoor training session by ID.
   * @param id - The ID of the indoor training session to retrieve.
   * @returns The found IndoorTraining.
   * @throws IndoorTrainingNotFoundException if the session is not found.
   */
  async detail(id: string): Promise<IndoorTrainingSubscription> {
    const result = await this.repository.findOneBy({
      indoor_training_subscription_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new IndoorTrainingSubscriptionNotFoundException();
  }

  /**
   * Creates a new indoor training session.
   * @param payload - Data for creating a new indoor training session.
   * @returns The created IndoorTraining.
   * @throws IndoorTrainingCreateException if creation fails.
   */
  async create(
    payload: IndoorTrainingSubscriptionCreatePayload,
  ): Promise<IndoorTrainingSubscription> {
    try {
      let resolvedMember;
      try {
        resolvedMember = await this.member_service.detail(
          payload.member.member_id.toString(),
        );
      } catch (e) {
        resolvedMember = null;
      }

      let resolvedIndoorTraining;
      try {
        resolvedIndoorTraining = await this.indoor_training_service.detail(
          payload.indoor_training.indoor_training_id.toString(),
        );
      } catch (e) {
        resolvedIndoorTraining = null;
      }

      return await this.repository.save(
        Builder<IndoorTrainingSubscription>()
          .indoor_training_subscription_id(UniqueId.generate())
          .purchase_date(payload.purchase_date)
          .indoor_training(Promise.resolve(resolvedIndoorTraining))
          .member(Promise.resolve(resolvedMember))
          .build(),
      );
    } catch (e) {
      console.log(e.message);
      throw new IndoorTrainingSubscriptionCreateException();
    }
  }

  /**
   * Updates an existing indoor training session.
   * @param payload - Data for updating the session.
   * @returns The updated IndoorTraining.
   * @throws IndoorTrainingUpdateException if update fails.
   */
  async update(
    payload: IndoorTrainingSubscriptionUpdatePayload,
  ): Promise<IndoorTrainingSubscription> {
    try {
      const detail = await this.detail(
        payload.indoor_training_subscription_id.toString(),
      );

      let resolvedMember;
      try {
        resolvedMember = await this.member_service.detail(
          payload.member.member_id.toString(),
        );
      } catch (e) {
        resolvedMember = null;
      }

      let resolvedIndoorTraining;
      try {
        resolvedIndoorTraining = await this.indoor_training_service.detail(
          payload.indoor_training.indoor_training_id.toString(),
        );
      } catch (e) {
        resolvedIndoorTraining = null;
      }

      detail.purchase_date = payload.purchase_date;
      detail.indoor_training = Promise.resolve(resolvedIndoorTraining);
      detail.member = Promise.resolve(resolvedMember);
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new IndoorTrainingSubscriptionUpdateException();
    }
  }

  /**
   * Deletes an indoor training session by ID.
   * @param id - The ID of the session to delete.
   * @throws IndoorTrainingDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      console.log(e.message);
      throw new IndoorTrainingSubscriptionDeleteException();
    }
  }
}
