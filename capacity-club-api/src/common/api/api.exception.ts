import { HttpException } from '@nestjs/common';
import { ApiCodeResponse } from './api-code.response';
import { ValidationError } from 'class-validator/types/validation/ValidationError';

// Custom exception class extending NestJS's HttpException for API-specific errors.
export class ApiException extends HttpException {
  /**
   * Constructor to initialize the ApiException with a specific API response code and HTTP status.
   * @param code - The API response code.
   * @param status - The HTTP status code.
   */
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

// Custom exception class for handling validation errors.
export class ValidationException extends HttpException {
  /**
   * Constructor to initialize the ValidationException with validation errors.
   * @param errors - An array of validation errors.
   */
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
