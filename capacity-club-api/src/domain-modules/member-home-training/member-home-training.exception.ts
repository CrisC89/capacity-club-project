import { ApiCodeResponse, ApiException } from '@common/api';

/**
 * Custom exceptions for MemberHomeTraining operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */
export class MemberHomeTrainingNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_HOME_TRAINING_NOT_FOUND, 200);
  }
}

export class MemberHomeTrainingDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_HOME_TRAINING_DELETE_ERROR, 200);
  }
}

export class MemberHomeTrainingListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_HOME_TRAINING_LIST_ERROR, 200);
  }
}

export class MemberHomeTrainingCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_HOME_TRAINING_CREATE_ERROR, 200);
  }
}

export class MemberHomeTrainingUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.MEMBER_HOME_TRAINING_UPDATE_ERROR, 200);
  }
}
