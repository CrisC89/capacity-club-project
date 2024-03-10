import { ulid } from 'ulid';

export class UniqueId {
  constructor(private unique_id: string) {}

  static generate() {
    return new UniqueId(ulid());
  }

  toString() {
    return this.unique_id;
  }
}

export const uniqueIdTransformer = {
  to(value: UniqueId): string | null {
    return value ? value.toString() : null;
  },
  from(value: string): UniqueId | null {
    return value ? new UniqueId(value) : null;
  },
};
