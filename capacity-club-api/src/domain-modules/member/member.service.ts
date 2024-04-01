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
import { MemberFilter } from './model/filter';
import { UniqueId } from '@common/model/unique-id';
import { Credential } from '@authenticated/model';

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

  async create(payload: MemberCreatePayload): Promise<Member> {
    try {
      const created_member = Object.assign(
        new Member(),
        Builder<Member>()
          .member_id(UniqueId.generate())
          .firstname(payload.firstname)
          .lastname(payload.lastname)
          .phone(payload.phone)
          .gender(payload.gender)
          .birthdate(payload.birthdate)
          .address(payload.address)
          .active(payload.active)
          .code_activation(payload.code_activation)
          .credential(payload.credential)
          .build(),
      );
      return await this.repository.save(created_member);
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
    const result = await this.repository.findOneBy({
      member_id: UniqueId.from(id),
    });
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
      const detail: Member = await this.detail(payload.member_id.toString());
      detail.firstname = payload.firstname;
      detail.lastname = payload.lastname;
      detail.birthdate = payload.birthdate;
      detail.gender = payload.gender;
      detail.phone = payload.phone;
      detail.address = payload.address;
      detail.active = payload.active;
      detail.credential = await this.credentialRepository.findOneBy({
        credential_id: payload.credential.credential_id,
      });
      return await this.repository.save(detail);
    } catch (e) {
      console.log(e.message);
      throw new MemberUpdateException();
    }
  }
}
