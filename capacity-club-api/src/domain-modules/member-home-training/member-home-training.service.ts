import { CrudService } from '@domain-modules-shared';
import { Injectable } from '@nestjs/common';
import {
  MemberHomeTraining,
  MemberHomeTrainingCreatePayload,
  MemberHomeTrainingFilter,
  MemberHomeTrainingUpdatePayload,
} from './model';
import { InjectRepository } from '@nestjs/typeorm';
import { isNil } from 'lodash';
import { Brackets, Repository } from 'typeorm';
import {
  MemberHomeTrainingCreateException,
  MemberHomeTrainingDeleteException,
  MemberHomeTrainingListException,
  MemberHomeTrainingNotFoundException,
  MemberHomeTrainingUpdateException,
} from './member-home-training.exception';
import { UniqueId } from '@common/model';
import { Builder } from 'builder-pattern';

/**
 * Service for managing member home training programs.
 * Implements CRUD operations and filtering for MemberHomeTraining entities.
 */
@Injectable()
export class MemberHomeTrainingService
  implements
    CrudService<
      MemberHomeTraining,
      MemberHomeTrainingCreatePayload,
      MemberHomeTrainingUpdatePayload,
      MemberHomeTrainingFilter,
      string
    >
{
  constructor(
    @InjectRepository(MemberHomeTraining)
    private readonly repository: Repository<MemberHomeTraining>,
  ) {}

  /**
   * Retrieves all member home training programs.
   * @returns A list of all MemberHomeTraining entries.
   * @throws MemberHomeTrainingListException if retrieval fails.
   */
  async getAll(): Promise<MemberHomeTraining[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberHomeTrainingListException();
    }
  }

  /**
   * Filters member home training programs based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberHomeTraining entries matching the criteria.
   */
  async filter(
    filter: MemberHomeTrainingFilter,
  ): Promise<MemberHomeTraining[]> {
    const queryBuilder = this.repository.createQueryBuilder(
      'member-home-training',
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
                  `CAST(EXTRACT(YEAR FROM "member-home-training"."purchase_date") AS int) = :year`,
                  { year },
                )
                  .andWhere(
                    `CAST(EXTRACT(MONTH FROM "member-home-training"."purchase_date") AS int) = :month`,
                    { month },
                  )
                  .andWhere(
                    `CAST(EXTRACT(DAY FROM "member-home-training"."purchase_date") AS int) = :day`,
                    { day },
                  );
              }),
            );
            break;
          case 'member':
            queryBuilder.andWhere('member-home-training.member = :member', {
              member: value,
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
   * Retrieves the details of a member home training program by ID.
   * @param id - The ID of the member home training program to retrieve.
   * @returns The found MemberHomeTraining.
   * @throws MemberHomeTrainingNotFoundException if the member home training program is not found.
   */
  async detail(id: string): Promise<MemberHomeTraining> {
    const result = await this.repository.findOneBy({
      member_home_training_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberHomeTrainingNotFoundException();
  }

  /**
   * Creates a new member home training program.
   * @param payload - Data for creating a new member home training program.
   * @returns The created MemberHomeTraining.
   * @throws MemberHomeTrainingCreateException if creation fails.
   */
  async create(
    payload: MemberHomeTrainingCreatePayload,
  ): Promise<MemberHomeTraining> {
    try {
      return await this.repository.save(
        Builder<MemberHomeTraining>()
          .member_home_training_id(UniqueId.generate())
          .purchase_date(payload.purchase_date)
          .member(Promise.resolve(payload.member))
          .build(),
      );
    } catch (e) {
      throw new MemberHomeTrainingCreateException();
    }
  }

  /**
   * Updates an existing member home training program.
   * @param payload - Data for updating the member home training program.
   * @returns The updated MemberHomeTraining.
   * @throws MemberHomeTrainingUpdateException if update fails.
   */
  async update(
    payload: MemberHomeTrainingUpdatePayload,
  ): Promise<MemberHomeTraining> {
    try {
      const detail = await this.detail(
        payload.member_home_training_id.toString(),
      );
      detail.purchase_date = payload.purchase_date;
      detail.member = Promise.resolve(payload.member);
      return await this.repository.save(detail);
    } catch (e) {
      throw new MemberHomeTrainingUpdateException();
    }
  }

  /**
   * Deletes an existing member home training program by ID.
   * @param id - The ID of the member home training program to delete.
   * @throws MemberHomeTrainingDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberHomeTrainingDeleteException();
    }
  }
}
