import { Exclude } from 'class-transformer';
import { CreateDateColumn } from 'typeorm';
// Abstract base entity class providing common properties for entity classes.
export abstract class BaseEntity {
  /**
   * Date when the entity was created.
   * Excluded from the plain object during serialization.
   */
  @Exclude({ toPlainOnly: true })
  @CreateDateColumn()
  created: Date;

  /**
   * Date when the entity was last updated.
   * Excluded from the plain object during serialization.
   */
  @Exclude({ toPlainOnly: true })
  @CreateDateColumn()
  updated: Date;
}
