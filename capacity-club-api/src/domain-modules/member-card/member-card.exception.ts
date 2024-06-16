import { ApiException, ApiCodeResponse } from '@common/api';

export class MemberCardNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_CARD_NOT_FOUND, 200);
  }
}

export class MemberCardDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_CARD_DELETE_ERROR, 200);
  }
}

export class MemberCardListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_CARD_LIST_ERROR, 200);
  }
}

export class MemberCardCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_CARD_CREATE_ERROR, 200);
  }
}

export class MemberCardUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_CARD_UPDATE_ERROR, 200);
  }
}
