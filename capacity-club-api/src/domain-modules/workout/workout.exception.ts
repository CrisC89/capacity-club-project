import { ApiException, ApiCodeResponse } from '@common/api';

export class WorkoutNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.WORKOUT_NOT_FOUND, 200);
  }
}

export class WorkoutDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.WORKOUT_DELETE_ERROR, 200);
  }
}

export class WorkoutListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.WORKOUT_LIST_ERROR, 200);
  }
}

export class WorkoutCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.WORKOUT_CREATE_ERROR, 200);
  }
}

export class WorkoutUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.WORKOUT_UPDATE_ERROR, 200);
  }
}
