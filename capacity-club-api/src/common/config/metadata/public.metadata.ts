import { SetMetadata } from '@nestjs/common';

// Defining a constant for the metadata key
export const IS_PUBLIC_KEY = 'isPublic';

// Creating a custom decorator named 'Public'
export const Public = () => SetMetadata(IS_PUBLIC_KEY, true);
