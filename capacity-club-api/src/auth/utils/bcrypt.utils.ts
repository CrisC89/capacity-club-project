import * as bcrypt from 'bcrypt';

/**
 * Encrypts a plaintext password using bcrypt.
 * @param plaintextPassword - The plaintext password to be encrypted.
 * @returns A promise that resolves to the hashed password.
 */
export const encryptPassword = async (
  plaintextPassword: string,
): Promise<string> => await bcrypt.hash(plaintextPassword, 10);

/**
 * Encrypts a plaintext password using bcrypt.
 * @param plaintextPassword - The plaintext password to be encrypted.
 * @returns A promise that resolves to the hashed password.
 */
export const comparePassword = async (
  plaintextPassword: string,
  hash: string,
): Promise<boolean> => await bcrypt.compare(plaintextPassword, hash);
