import { ApiException, ApiCodeResponse } from '@common/api';

export class IndoorTrainingNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_NOT_FOUND, 200);
  }
}

export class IndoorTrainingDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_DELETE_ERROR, 200);
  }
}

export class IndoorTrainingListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_LIST_ERROR, 200);
  }
}

export class IndoorTrainingCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_CREATE_ERROR, 200);
  }
}

export class IndoorTrainingUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_CREATE_ERROR, 200);
  }
}
