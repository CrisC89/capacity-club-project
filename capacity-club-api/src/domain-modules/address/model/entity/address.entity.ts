import { Entity, BaseEntity, PrimaryColumn, Column } from 'typeorm';
import { ulid } from 'ulid';

@Entity()
export class Address extends BaseEntity {
  @PrimaryColumn('varchar', { length: 26, default: () => `'${ulid()}'` })
  address_id: string;
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
