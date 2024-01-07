import { PrimaryColumn } from 'typeorm/decorator/columns/PrimaryColumn';
import { ulid } from 'ulid';

export function UlidPrimaryColumn() {
  return function (target: any, propertyKey: string) {
    PrimaryColumn('varchar', {
      length: 26,
      default: () => `'${ulid()}'`,
      name: propertyKey,
    })(target, propertyKey);
  };
}
