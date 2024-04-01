import { TransformFnParams } from 'class-transformer';
import { ulid } from 'ulid';

export class UniqueId {
  constructor(private unique_id: string) {}

  static generate() {
    return new UniqueId(ulid());
  }

  static from(id: string) {
    return new UniqueId(id);
  }

  toString() {
    return this.unique_id;
  }
}

export const uniqueIdTransformer = {
  to(params: TransformFnParams): UniqueId {
    const plainId = params.value;
    return UniqueId.from(plainId);
  },
  from(params: TransformFnParams): string {
    const instance: UniqueId = params.value;
    return instance.toString();
  },
};
