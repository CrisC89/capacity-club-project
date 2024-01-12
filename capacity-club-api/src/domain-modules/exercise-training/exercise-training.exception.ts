import { ApiException, ApiCodeResponse } from '@common/api';

export class ExerciseTrainingNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_TRAINING_NOT_FOUND, 200);
  }
}

export class ExerciseTrainingDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_TRAINING_DELETE_ERROR, 200);
  }
}

export class ExerciseTrainingListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_TRAINING_LIST_ERROR, 200);
  }
}

export class ExerciseTrainingCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_TRAINING_CREATE_ERROR, 200);
  }
}

export class ExerciseTrainingUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_TRAINING_UPDATE_ERROR, 200);
  }
}
