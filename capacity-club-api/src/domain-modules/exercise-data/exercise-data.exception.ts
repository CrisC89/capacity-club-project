import { ApiException, ApiCodeResponse } from '@common/api';

/**
 * Custom exceptions for ExerciseData operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */
export class ExerciseDataNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_DATA_NOT_FOUND, 200);
  }
}

export class ExerciseDataDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_DATA_DELETE_ERROR, 200);
  }
}

export class ExerciseDataListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_DATA_LIST_ERROR, 200);
  }
}

export class ExerciseDataCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_DATA_CREATE_ERROR, 200);
  }
}

export class ExerciseDataUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.EXERCISE_DATA_UPDATE_ERROR, 200);
  }
}
