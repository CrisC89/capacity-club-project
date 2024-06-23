import { ApiCodeResponse, ApiException } from '@common/api';

/**
 * Custom exceptions for TrainingCircuit operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */

export class TrainingCircuitNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TRAINING_CIRCUIT_NOT_FOUND, 200);
  }
}

export class TrainingCircuitDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TRAINING_CIRCUIT_DELETE_ERROR, 200);
  }
}

export class TrainingCircuitListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TRAINING_CIRCUIT_LIST_ERROR, 200);
  }
}

export class TrainingCircuitCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TRAINING_CIRCUIT_CREATE_ERROR, 200);
  }
}

export class TrainingCircuitUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TRAINING_CIRCUIT_UPDATE_ERROR, 200);
  }
}
