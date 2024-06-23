import { createParamDecorator, ExecutionContext } from '@nestjs/common';

/**
 * Creating a custom parameter decorator named 'User'.
 * This decorator extracts the user object from the HTTP request and makes it available as a parameter in route handlers.
 */
export const User = createParamDecorator(
  /**
   * The decorator factory function.
   * @param data - Additional data passed to the decorator (not used here).
   * @param ctx - The execution context of the request.
   * @returns The user object from the request.
   */
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.user;
  },
);
