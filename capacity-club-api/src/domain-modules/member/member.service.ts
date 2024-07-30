import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { CrudService } from 'domain-modules/shared/model/interface/crud-service.interface';
import { isNil } from 'lodash';
import { Brackets, Repository } from 'typeorm';
import { Member, MemberCreatePayload, MemberUpdatePayload } from './model';
import {
  MemberCreateException,
  MemberDeleteException,
  MemberListException,
  MemberNotFoundException,
  MemberUpdateException,
} from './member.exception';
import { MemberFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';
import { Credential } from '@auth/model';

/**
 * Service for managing members.
 * Implements CRUD operations and filtering for Member entities.
 */
@Injectable()
export class MemberService
  implements
    CrudService<
      Member,
      MemberCreatePayload,
      MemberUpdatePayload,
      MemberFilter,
      string
    >
{
  constructor(
    @InjectRepository(Member) private readonly repository: Repository<Member>,
    @InjectRepository(Credential)
    private credentialRepository: Repository<Credential>,
  ) {}

  /**
   * Creates a new member.
   * @param payload - Data for creating a new member.
   * @returns The created Member.
   * @throws MemberCreateException if creation fails.
   */
  async create(payload: MemberCreatePayload): Promise<Member> {
    try {
      const created_member = Object.assign(
        new Member(),
        Builder<Member>()
          .member_id(UniqueId.generate())
          .firstname(payload.firstname)
          .lastname(payload.lastname)
          .phone(payload.phone)
          .mail(payload.mail)
          .gender(payload.gender)
          .birthdate(payload.birthdate)
          .address(payload.address)
          .active(payload.active)
          .code_activation(payload.code_activation)
          .credential(Promise.resolve(payload.credential))
          .build(),
      );
      return await this.repository.save(created_member);
    } catch (e) {
      console.log(e.message);
      throw new MemberCreateException();
    }
  }

  /**
   * Deletes a member by ID.
   * @param id - The ID of the member to delete.
   * @throws MemberDeleteException if deletion fails.
   */
  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberDeleteException();
    }
  }

  /**
   * Retrieves the details of a member by ID.
   * @param id - The ID of the member to retrieve.
   * @returns The found Member.
   * @throws MemberNotFoundException if the member is not found.
   */
  async detail(id: string): Promise<Member> {
    const result = await this.repository.findOneBy({
      member_id: UniqueId.from(id),
    });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberNotFoundException();
  }

  /**
   * Filters members based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of Member entries matching the criteria.
   */
  async filter(filter: MemberFilter): Promise<Member[]> {
    const queryBuilder = this.repository.createQueryBuilder('member');

    Object.keys(filter).forEach((key) => {
      const value = filter[key];
      if (value !== undefined && value !== null) {
        switch (key) {
          case 'firstname':
            queryBuilder.andWhere('member.firstname LIKE :firstname', {
              firstname: `%${value}%`,
            });
            break;
          case 'lastname':
            queryBuilder.andWhere('member.lastname LIKE :lastname', {
              lastname: `%${value}%`,
            });
            break;
          case 'birthdate':
            const date = new Date(value);
            const year: number = date.getUTCFullYear();
            const month: number = date.getUTCMonth() + 1;
            const day: number = date.getUTCDate();

            queryBuilder.andWhere(
              new Brackets((qb) => {
                qb.where(
                  `CAST(EXTRACT(YEAR FROM "member"."birthdate") AS int) = :year`,
                  { year },
                )
                  .andWhere(
                    `CAST(EXTRACT(MONTH FROM "member"."birthdate") AS int) = :month`,
                    { month },
                  )
                  .andWhere(
                    `CAST(EXTRACT(DAY FROM "member"."birthdate") AS int) = :day`,
                    { day },
                  );
              }),
            );
            break;
          case 'mail':
            queryBuilder.andWhere('member.mail LIKE :mail', {
              mail: `%${value}%`,
            });
            break;
          case 'phone':
            queryBuilder.andWhere('member.phone LIKE :phone', {
              phone: `%${value}%`,
            });
            break;
          case 'code_activation':
            queryBuilder.andWhere(
              'member.code_activation LIKE :code_activation',
              { code_activation: `%${value}%` },
            );
            break;
          case 'active':
            queryBuilder.andWhere('member.active = :active', { active: value });
            break;
          default:
            break;
        }
      }
    });

    return queryBuilder.getMany();
  }

  /**
   * Retrieves all members.
   * @returns A list of all Member entries.
   * @throws MemberListException if retrieval fails.
   */
  async getAll(): Promise<Member[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberListException();
    }
  }

  /**
   * Updates an existing member.
   * @param payload - Data for updating the member.
   * @returns The updated Member.
   * @throws MemberUpdateException if update fails.
   */
  async update(payload: MemberUpdatePayload): Promise<Member> {
    try {
      const detail: Member = await this.detail(payload.member_id.toString());
      detail.firstname = payload.firstname;
      detail.lastname = payload.lastname;
      detail.birthdate = payload.birthdate;
      detail.gender = payload.gender;
      detail.phone = payload.phone;
      detail.mail = payload.mail;
      detail.address = payload.address;
      detail.active = payload.active;
      detail.credential = Promise.resolve(
        await this.credentialRepository.findOneBy({
          credential_id: payload.credential.credential_id,
        }),
      );
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new MemberUpdateException();
    }
  }
}
