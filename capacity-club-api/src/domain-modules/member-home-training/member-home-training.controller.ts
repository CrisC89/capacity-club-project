import { CrudController } from '@domain-modules-shared';
import { Controller } from '@nestjs/common';
import { MemberHomeTrainingService } from './member-home-training.service';
import { MemberHomeTrainingUpdatePayload } from './model/payload/member-home-training-update.payload';
import { MemberHomeTraining } from './model/entity/member_home_training.entity';
import { MemberHomeTrainingFilter } from './model/filter/member_home_training.filter';
import { MemberHomeTrainingCreatePayload } from './model/payload/member-home-training-create.payload';

/**
 * Controller for managing member home training programs.
 * Provides endpoints for creating, deleting, retrieving, filtering, listing, and updating member home training programs.
 */
@Controller('member-home-training')
export class MemberHomeTrainingController
  implements
    CrudController<
      MemberHomeTraining,
      MemberHomeTrainingCreatePayload,
      MemberHomeTrainingUpdatePayload,
      MemberHomeTrainingFilter,
      string
    >
{
  constructor(private readonly service: MemberHomeTrainingService) {}

  /**
   * Endpoint to retrieve all member home training programs.
   * @returns A list of all MemberHomeTraining entries.
   */
  getAll(): Promise<MemberHomeTraining[]> {
    return this.service.getAll();
  }

  /**
   * Endpoint to filter member home training programs based on specified criteria.
   * @param filter - The filtering criteria.
   * @returns A list of MemberHomeTraining entries matching the criteria.
   */
  filter(filter: MemberHomeTrainingFilter): Promise<MemberHomeTraining[]> {
    return this.service.filter(filter);
  }

  /**
   * Endpoint to retrieve the details of a member home training program by ID.
   * @param id - The ID of the member home training program to retrieve.
   * @returns The found MemberHomeTraining.
   */
  detail(id: string): Promise<MemberHomeTraining> {
    return this.service.detail(id);
  }

  /**
   * Endpoint to create a new member home training program.
   * @param payload - Data for creating a new member home training program.
   * @returns The created MemberHomeTraining.
   */
  create(
    payload: MemberHomeTrainingCreatePayload,
  ): Promise<MemberHomeTraining> {
    return this.service.create(payload);
  }

  /**
   * Endpoint to update an existing member home training program.
   * @param payload - Data for updating the member home training program.
   * @returns The updated MemberHomeTraining.
   */
  update(
    payload: MemberHomeTrainingUpdatePayload,
  ): Promise<MemberHomeTraining> {
    return this.service.update(payload);
  }

  /**
   * Endpoint to delete a member home training program by ID.
   * @param id - The ID of the member home training program to delete.
   */
  delete(id: string): Promise<void> {
    return this.service.delete(id);
  }
}
