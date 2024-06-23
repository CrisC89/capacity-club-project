import { ApiCodeResponse, ApiException } from '@common/api';

/**
 * This file defines custom exception classes for handling various error scenarios in the application.
 * Each exception class extends from ApiException and is associated with a specific API response code and HTTP status code.
 * These exceptions provide standardized error handling and responses for different error conditions.
 */

export class NoTokenFoundedException extends ApiException {
  constructor() {
    super(ApiCodeResponse.NO_TOKEN_FOUNDED, 401);
  }
}
export class UserNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.USER_NOT_FOUND, 200);
  }
}
export class TokenExpiredException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TOKEN_EXPIRED, 401);
  }
}
export class SignupException extends ApiException {
  constructor() {
    super(ApiCodeResponse.SIGNUP_ERROR, 200);
  }
}
export class CredentialDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.CREDENTIAL_DELETE_ERROR, 200);
  }
}
export class UserAlreadyExistException extends ApiException {
  constructor() {
    super(ApiCodeResponse.USER_ALREADY_EXIST, 200);
  }
}
export class TokenGenerationException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TOKEN_GEN_ERROR, 500);
  }
}
