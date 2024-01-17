import { ApiException, ApiCodeResponse } from '@common/api';

export class CollectiveTrainingSessionNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_SESSION_NOT_FOUND, 200);
  }
}

export class CollectiveTrainingSessionDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_SESSION_DELETE_ERROR, 200);
  }
}

export class CollectiveTrainingSessionListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_SESSION_LIST_ERROR, 200);
  }
}

export class CollectiveTrainingSessionCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_SESSION_CREATE_ERROR, 200);
  }
}

export class CollectiveTrainingSessionUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_SESSION_CREATE_ERROR, 200);
  }
}
