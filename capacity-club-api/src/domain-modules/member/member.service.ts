import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Builder } from 'builder-pattern';
import { CrudService } from 'domain-modules/shared/model/interface/crud-service.interface';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import { Member, MemberCreatePayload, MemberUpdatePayload } from './model';
import {
  MemberCreateException,
  MemberDeleteException,
  MemberListException,
  MemberNotFoundException,
  MemberUpdateException,
} from './member.exception';
import { ulid } from 'ulid';
import { MemberFilter } from './model/filter';

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
  ) {}

  async create(payload: MemberCreatePayload): Promise<Member> {
    try {
      /*
      return await this.repository.save(
        Builder<Member>()
          .firstname(payload.firstname)
          .lastname(payload.lastname)
          .mail(payload.mail)
          .iban(payload.iban)
          .phone(payload.phone)
          .gender(payload.gender)
          .birthdate(payload.birthdate)
          .address(payload.address)
          .active(payload.active)
          .build(),
      ); */
      const newMember = Object.assign(
        new Member(),
        Builder<Member>()
          .member_id(ulid())
          .firstname(payload.firstname)
          .lastname(payload.lastname)
          .mail(payload.mail)
          .iban(payload.iban)
          .phone(payload.phone)
          .gender(payload.gender)
          .birthdate(payload.birthdate)
          .address(payload.address)
          .active(payload.active)
          .code_activation(payload.code_activation)
          .build(),
      );
      return await this.repository.save(newMember);
    } catch (e) {
      console.log(e.message);
      throw new MemberCreateException();
    }
  }

  async delete(id: string): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.repository.remove(detail);
    } catch (e) {
      throw new MemberDeleteException();
    }
  }

  async detail(id: string): Promise<Member> {
    const result = await this.repository.findOneBy({ member_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new MemberNotFoundException();
  }

  filter(filter: MemberFilter): Promise<Member[]> {
    const queryBuilder = this.repository.createQueryBuilder('member');

    Object.keys(filter).forEach((key) => {
      if (filter[key] !== undefined && filter[key] !== null) {
        const value = filter[key];
        if (typeof value === 'boolean') {
          queryBuilder.andWhere(`member.${key} = :${key}`, { [key]: value });
        } else {
          queryBuilder.andWhere(`member.${key} LIKE :${key}`, {
            [key]: `%${value}%`,
          });
        }
      }
    });

    return queryBuilder.getMany();

    //console.log(filter);
    //return Promise.resolve([]);
  }

  async getAll(): Promise<Member[]> {
    try {
      return await this.repository.find();
    } catch (e) {
      throw new MemberListException();
    }
  }

  async update(payload: MemberUpdatePayload): Promise<Member> {
    try {
      const detail: Member = await this.detail(payload.member_id);
      detail.firstname = payload.firstname;
      detail.lastname = payload.lastname;
      detail.birthdate = payload.birthdate;
      detail.gender = payload.gender;
      detail.mail = payload.mail;
      detail.phone = payload.phone;
      detail.iban = payload.iban;
      detail.address = payload.address;
      detail.active = payload.active;
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new MemberUpdateException();
    }
  }
}
