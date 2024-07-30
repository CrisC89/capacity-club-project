import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { CrudService } from 'domain-modules/shared/model/interface/crud-service.interface';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  MemberPlanCreateException,
  MemberPlanDeleteException,
  MemberPlanNotFoundException,
  MemberPlanListException,
  MemberPlanUpdateException,
} from './member-plan.exception';
import { MemberPlan, MemberPlanCreatePayload } from './model';
import { MemberPlanUpdatePayload } from './model/payload/member-plan-update.payload';
import { MemberPlanFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';

/**
 * Service for managing member plans.
 * Implements CRUD operations and filtering for MemberPlan entities.
 */
@Injectable()
export class MemberPlanService
  implements
    CrudService<
      MemberPlan,
      MemberPlanCreatePayload,
      MemberPlanUpdatePayload,
      MemberPlanFilter,
      string
    >
{
  constructor(
    @InjectRepository(MemberPlan)
    private readonly repository: Repository<MemberPlan>,
  ) {}

  /**
   * Creates a new member plan.
   * @param payload - Data for creating a new member plan.
   * @returns The created MemberPlan.
   * @throws MemberPlanCreateException if creation fails.
   */
  async create(payload: MemberPlanCreatePayload): Promise<MemberPlan> {
    try {
      return await this.repository.save(
        Builder<MemberPlan>()
          .member_plan_id(UniqueId.generate())
          .title(payload.title)
          .description(payload.description)
          .nb_collective_training(payload.nb_collective_training)
          .nb_individual_training(payload.nb_individual_training)
          .price(payload.price)
          .build(),
      );
    } catch (e) {
      throw new MemberPlanCreateException();
    }
  }

  /**
   * Deletes an existing member plan by ID.
   * @param id - The ID of the member plan to delete.
   * @throws MemberPlanDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberPlanDeleteException();
    }
  }

  /**
   * Retrieves the details of a member plan by ID.
   * @param id - The ID of the member plan to retrieve.
   * @returns The found MemberPlan.
   * @throws MemberPlanNotFoundException if the member plan is not found.
   */
  async detail(id: string): Promise<MemberPlan> {
    const result = await this.repository.findOneBy({ member_plan_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberPlanNotFoundException();
  }

  /**
   * Filters member plans based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberPlan entries matching the criteria.
   */
  async filter(filter: MemberPlanFilter): Promise<MemberPlan[]> {
    const queryBuilder = this.repository.createQueryBuilder('member-plan');

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'title':
            queryBuilder.andWhere('member-plan.title LIKE :title', {
              title: `%${value}%`,
            });
            break;
          case 'nb_individual_training':
            queryBuilder.andWhere(
              'member-plan.nb_individual_training = :nb_individual_training',
              { nb_individual_training: value },
            );
            break;
          case 'nb_collective_training':
            queryBuilder.andWhere(
              'member-plan.nb_collective_training = :nb_collective_training',
              { nb_collective_training: value },
            );
            break;
          case 'price':
            queryBuilder.andWhere('member-plan.price = :price', {
              price: value,
            });
            break;
          default:
            break;
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves all member plans.
   * @returns A list of all MemberPlan entries.
   * @throws MemberPlanListException if retrieval fails.
   */
  getAll(): Promise<MemberPlan[]> {
    try {
      return this.repository.find();
    } catch (e) {
      throw new MemberPlanListException();
    }
  }

  /**
   * Updates an existing member plan.
   * @param payload - Data for updating the member plan.
   * @returns The updated MemberPlan.
   * @throws MemberPlanUpdateException if update fails.
   */
  async update(payload: MemberPlanUpdatePayload): Promise<MemberPlan> {
    try {
      const detail = await this.detail(payload.member_plan_id.toString());
      detail.title = payload.title;
      detail.description = payload.description;
      detail.nb_collective_training = payload.nb_collective_training;
      detail.nb_individual_training = payload.nb_individual_training;
      detail.price = payload.price;
      return await this.repository.save(detail);
    } catch (e) {
      throw new MemberPlanUpdateException();
    }
  }
}
