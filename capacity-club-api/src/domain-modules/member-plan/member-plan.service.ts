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

  async create(payload: MemberPlanCreatePayload): Promise<MemberPlan> {
    try {
      return await this.repository.save(
        Builder<MemberPlan>()
          .type(payload.type)
          .title(payload.title)
          .description(payload.description)
          .picture(payload.picture)
          .price(payload.price)
          .nb_month(payload.nb_month)
          .payment(payload.payment)
          .cumulative(payload.cumulative)
          .nb_training(payload.nb_training)
          .freq_training(payload.freq_training)
          .build(),
      );
    } catch (e) {
      throw new MemberPlanCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberPlanDeleteException();
    }
  }

  async detail(id: string): Promise<MemberPlan> {
    const result = await this.repository.findOneBy({ member_plan_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberPlanNotFoundException();
  }

  filter(filter: MemberPlanFilter): Promise<MemberPlan[]> {
    const queryBuilder = this.repository.createQueryBuilder('member-plan');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`member.${key} = :${key}`, {
            [key]: value,
          });
        } else {
          queryBuilder.andWhere(`member.${key} LIKE :${key}`, {
            [key]: `%${value}%`,
          });
        }
      }
    });

    return queryBuilder.getMany();
  }

  getAll(): Promise<MemberPlan[]> {
    try {
      return this.repository.find();
    } catch (e) {
      throw new MemberPlanListException();
    }
  }

  async update(payload: MemberPlanUpdatePayload): Promise<MemberPlan> {
    try {
      const detail = await this.detail(payload.member_plan_id);
      detail.type = payload.type;
      detail.title = payload.title;
      detail.description = payload.description;
      detail.picture = payload.picture;
      detail.price = payload.price;
      detail.nb_month = payload.nb_month;
      detail.payment = payload.payment;
      detail.cumulative = payload.cumulative;
      detail.freq_training = payload.freq_training;
      detail.nb_training = payload.nb_training;
      return await this.repository.save(detail);
    } catch (e) {
      throw new MemberPlanUpdateException();
    }
  }
}
