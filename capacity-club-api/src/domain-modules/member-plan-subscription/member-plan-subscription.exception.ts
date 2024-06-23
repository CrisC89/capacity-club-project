import { ApiCodeResponse, ApiException } from '@common/api';

/**
 * Custom exceptions for MemberPlanSubscription operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */

export class MemberPlanSubscriptionNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_SUBSCRIPTION_NOT_FOUND, 200);
  }
}

export class MemberPlanSubscriptionDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_SUBSCRIPTION_DELETE_ERROR, 200);
  }
}

export class MemberPlanSubscriptionListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_SUBSCRIPTION_LIST_ERROR, 200);
  }
}

export class MemberPlanSubscriptionCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_SUBSCRIPTION_CREATE_ERROR, 200);
  }
}

export class MemberPlanSubscriptionUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_PLAN_SUBSCRIPTION_CREATE_ERROR, 200);
  }
}
