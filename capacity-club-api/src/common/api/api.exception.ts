import { HttpException } from '@nestjs/common';
import { ApiCodeResponse } from './api-code.response';
import { ValidationError } from 'class-validator/types/validation/ValidationError';

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

export class ValidationException extends HttpException {
  constructor(errors: ValidationError[]) {
    console.log(errors);
    super(
      {
        code: ApiCodeResponse.PAYLOAD_IS_NOT_VALID,
        data: errors.map((e) => Object.values(e.constraints)).flat(),
        result: false,
      },
      499,
    );
  }
}
