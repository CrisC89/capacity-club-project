import { TransformFnParams } from 'class-transformer';
import { ulid } from 'ulid';

// Class representing a unique identifier.
export class UniqueId {
  constructor(private unique_id: string) {}

  /**
   * Generates a new UniqueId using the ulid library.
   * @returns A new instance of UniqueId.
   */
  static generate() {
    return new UniqueId(ulid());
  }

  /**
   * Creates a UniqueId instance from an existing ID string.
   * @param id - The existing ID string.
   * @returns A new instance of UniqueId.
   */
  static from(id: string) {
    return new UniqueId(id);
  }

  /**
   * Converts the UniqueId instance to a string.
   * @returns The unique ID as a string.
   */
  toString() {
    return this.unique_id;
  }
}

// Transformer object for converting UniqueId instances to and from plain strings.
export const uniqueIdTransformer = {
  /**
   * Transforms a plain string to a UniqueId instance.
   * @param params - The transformation parameters containing the plain string value.
   * @returns A UniqueId instance.
   */
  to(params: TransformFnParams): UniqueId {
    const plainId = params.value;
    return UniqueId.from(plainId);
  },

  /**
   * Transforms a UniqueId instance to a plain string.
   * @param params - The transformation parameters containing the UniqueId instance.
   * @returns The unique ID as a string.
   */
  from(params: TransformFnParams): string {
    const instance: UniqueId = params.value;
    return instance.toString();
  },
};
