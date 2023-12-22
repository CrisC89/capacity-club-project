import { HttpException } from '@nestjs/common';
import { ApiCodeResponse } from './api-code.response';

// Custom exception class extending NestJS's HttpException for API-specific errors.
export class ApiException extends HttpException {
  // Constructor to initialize the ApiException with a specific API response code and HTTP status.
  constructor(code: ApiCodeResponse, status: number) {
    super(
      {
        code: code,
        data: null,
        result: false,
      },
      status,
    );
  }
}
