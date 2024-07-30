import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { Entity, BaseEntity, PrimaryColumn, Column } from 'typeorm';

/**
 * Entity representing an address.
 */
@Entity()
export class Address extends BaseEntity {
  /**
   * Unique identifier for the address.
   * Uses a custom transformer for serialization.
   */
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  address_id: UniqueId;
  @Column({ length: 50, nullable: false, unique: false })
  street: string;
  @Column({ length: 8, nullable: false, unique: false })
  number: string;
  @Column({ length: 10, nullable: false, unique: false })
  zipcode: string;
  @Column({ length: 50, nullable: false, unique: false })
  town: string;
  @Column({ length: 50, nullable: false, unique: false })
  country: string;
  @Column({ nullable: true, unique: false })
  complement: string;
}
