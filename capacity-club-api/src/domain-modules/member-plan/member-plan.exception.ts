import { ApiException, ApiCodeResponse } from '@common/api';

/**
 * Custom exceptions for MemberPlan operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */
export class MemberPlanNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_NOT_FOUND, 200);
  }
}

export class MemberPlanDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_DELETE_ERROR, 200);
  }
}

export class MemberPlanListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_LIST_ERROR, 200);
  }
}

export class MemberPlanCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_CREATE_ERROR, 200);
  }
}

export class MemberPlanUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_CREATE_ERROR, 200);
  }
}
