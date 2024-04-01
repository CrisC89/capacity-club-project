import { UniqueId, uniqueIdTransformer } from '@common/model/unique-id';
import { Transform } from 'class-transformer';
import { Entity, BaseEntity, PrimaryColumn, Column } from 'typeorm';

@Entity()
export class Address extends BaseEntity {
  @PrimaryColumn('varchar')
  @Transform(uniqueIdTransformer.to, { toClassOnly: true })
  @Transform(uniqueIdTransformer.from, { toPlainOnly: true })
  address_id: UniqueId;
  @Column({ length: 50, nullable: true, unique: false })
  street: string;
  @Column({ length: 8, nullable: true, unique: false })
  number: string;
  @Column({ length: 10, nullable: true, unique: false })
  zipcode: string;
  @Column({ length: 50, nullable: true, unique: false })
  town: string;
  @Column({ length: 50, nullable: true, unique: false })
  country: string;
  @Column({ nullable: true, unique: false })
  complement: string;
}
