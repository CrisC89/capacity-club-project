import { ApiException, ApiCodeResponse } from '@common/api';

export class PersonnalTrainingNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.PERSONNAL_TRAINING_NOT_FOUND, 200);
  }
}

export class PersonnalTrainingDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.PERSONNAL_TRAINING_DELETE_ERROR, 200);
  }
}

export class PersonnalTrainingListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.PERSONNAL_TRAINING_LIST_ERROR, 200);
  }
}

export class PersonnalTrainingCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.PERSONNAL_TRAINING_CREATE_ERROR, 200);
  }
}

export class PersonnalTrainingUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.PERSONNAL_TRAINING_UPDATE_ERROR, 200);
  }
}
