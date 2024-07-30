import { ApiCodeResponse, ApiException } from '@common/api';

/**
 * Custom exceptions for IndoorTrainingSubscription operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */

export class IndoorTrainingSubscriptionNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_SUBSCRIPTION_NOT_FOUND, 200);
  }
}

export class IndoorTrainingSubscriptionDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_SUBSCRIPTION_DELETE_ERROR, 200);
  }
}

export class IndoorTrainingSubscriptionListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_SUBSCRIPTION_LIST_ERROR, 200);
  }
}

export class IndoorTrainingSubscriptionCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_SUBSCRIPTION_CREATE_ERROR, 200);
  }
}

export class IndoorTrainingSubscriptionUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.INDOOR_TRAINING_SUBSCRIPTION_CREATE_ERROR, 200);
  }
}
