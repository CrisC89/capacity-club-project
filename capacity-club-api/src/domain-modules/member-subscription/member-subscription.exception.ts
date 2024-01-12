import { ApiCodeResponse, ApiException } from '@common/api';

export class MemberSubscriptionNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_SUBSCRIPTION_NOT_FOUND, 200);
  }
}

export class MemberSubscriptionDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_SUBSCRIPTION_DELETE_ERROR, 200);
  }
}

export class MemberSubscriptionListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_SUBSCRIPTION_LIST_ERROR, 200);
  }
}

export class MemberSubscriptionCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_SUBSCRIPTION_CREATE_ERROR, 200);
  }
}

export class MemberSubscriptionUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_SUBSCRIPTION_CREATE_ERROR, 200);
  }
}
