import { Exclude } from 'class-transformer';
import { CreateDateColumn } from 'typeorm';

export abstract class BaseEntity {
  @Exclude({ toPlainOnly: true })
  @CreateDateColumn()
  created: Date;

  @Exclude({ toPlainOnly: true })
  @CreateDateColumn()
  updated: Date;
}
