import { ApiException, ApiCodeResponse } from '@common/api';

export class HomeTrainingNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.HOME_TRAINING_NOT_FOUND, 200);
  }
}

export class HomeTrainingDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.HOME_TRAINING_DELETE_ERROR, 200);
  }
}

export class HomeTrainingListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.HOME_TRAINING_LIST_ERROR, 200);
  }
}

export class HomeTrainingCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.HOME_TRAINING_CREATE_ERROR, 200);
  }
}

export class HomeTrainingUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.HOME_TRAINING_UPDATE_ERROR, 200);
  }
}
