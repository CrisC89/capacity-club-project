import { CrudService } from '@domain-modules-shared';
import {
  IndoorTrainingSubscription,
  IndoorTrainingSubscriptionCreatePayload,
  IndoorTrainingSubscriptionFilter,
  IndoorTrainingSubscriptionUpdatePayload,
} from './model';
import { Injectable } from '@nestjs/common';
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
      return await this.repository.save(
        Builder<IndoorTrainingSubscription>()
          .indoor_training_subscription_id(UniqueId.generate())
          .purchase_date(payload.purchase_date)
          .indoor_training(Promise.resolve(payload.indoor_training))
          .member(Promise.resolve(payload.member))
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
      detail.purchase_date = payload.purchase_date;
      detail.indoor_training = Promise.resolve(payload.indoor_training);
      detail.member = Promise.resolve(payload.member);
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
