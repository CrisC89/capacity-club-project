import { HttpException } from '@nestjs/common';
import { ApiCodeResponse } from './api-code.response';
import { ValidationError } from 'class-validator/types/validation/ValidationError';
import { isNil } from 'lodash';

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
    super(
      {
        code: ApiCodeResponse.PAYLOAD_IS_NOT_VALID,
        data: errors.map((e) => validationErrorToApiCodeResponse(e)).flat(),
        result: false,
      },
      499 as number,
    );
  }
}

export const validationErrorToApiCodeResponse = (
  error: ValidationError,
): ApiCodeResponse[] => {
  return Object.keys(error.constraints).map((k: string) => {
    const code =
      ApiCodeResponse[
        `${camelToSnake(error.property)}_${camelToSnake(
          k,
        )}` as keyof typeof ApiCodeResponse
      ];
    return isNil(code) ? ApiCodeResponse.PAYLOAD_PARAM_IS_MISSING : code;
  });
};
export const camelToSnake = (str: string): string => {
  return str
    .replace(/([A-Z])/g, ' $1')
    .split(' ')
    .join('_')
    .toUpperCase();
};
