import { ApiException, ApiCodeResponse } from '@common/api';

/**
 * Custom exceptions for Member operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */

export class MemberNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_NOT_FOUND, 200);
  }
}

export class MemberDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_DELETE_ERROR, 200);
  }
}

export class MemberListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_LIST_ERROR, 200);
  }
}

export class MemberCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_CREATE_ERROR, 200);
  }
}

export class MemberUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_UPDATE_ERROR, 200);
  }
}
