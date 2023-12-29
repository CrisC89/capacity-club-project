import { createParamDecorator, ExecutionContext } from '@nestjs/common';

// Creating a custom parameter decorator named 'User'
export const User = createParamDecorator(
  // The decorator factory function
  (data: unknown, ctx: ExecutionContext) => {
    // Extracting the HTTP request from the execution context
    const request = ctx.switchToHttp().getRequest();
    // Returning the user object from the request
    return request.user;
  },
);
