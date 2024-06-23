import { SetMetadata } from '@nestjs/common';

// Defining a constant for the metadata key
export const IS_PUBLIC_KEY = 'isPublic';

/**
 * Creating a custom decorator named 'Public'.
 * This decorator marks a route as public, meaning it bypasses any guards that would normally protect it.
 * @returns A decorator function that sets metadata indicating the route is public.
 */
export const Public = () => SetMetadata(IS_PUBLIC_KEY, true);
