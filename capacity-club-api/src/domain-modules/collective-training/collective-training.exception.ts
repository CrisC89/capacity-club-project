import { ApiException, ApiCodeResponse } from '@common/api';

export class CollectiveTrainingNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_NOT_FOUND, 200);
  }
}

export class CollectiveTrainingDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_DELETE_ERROR, 200);
  }
}

export class CollectiveTrainingListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_LIST_ERROR, 200);
  }
}

export class CollectiveTrainingCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_CREATE_ERROR, 200);
  }
}

export class CollectiveTrainingUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.COLLECTIVE_TRAINING_CREATE_ERROR, 200);
  }
}
