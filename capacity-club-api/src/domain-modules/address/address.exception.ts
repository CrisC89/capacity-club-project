import { ApiException, ApiCodeResponse } from '@common/api';

/**
 * Custom exceptions for Address operations.
 * These exceptions provide specific error messages and codes for different failure scenarios.
 */
export class AddressNotFoundException extends ApiException {
  constructor() {
    super(ApiCodeResponse.ADDRESS_NOT_FOUND, 200);
  }
}

export class AddressDeleteException extends ApiException {
  constructor() {
    super(ApiCodeResponse.ADDRESS_DELETE_ERROR, 200);
  }
}

export class AddressFilterException extends ApiException {
  constructor() {
    super(ApiCodeResponse.ADDRESS_FILTER_ERROR, 200);
  }
}

export class AddressListException extends ApiException {
  constructor() {
    super(ApiCodeResponse.ADDRESS_LIST_ERROR, 200);
  }
}

export class AddressCreateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.ADDRESS_CREATE_ERROR, 200);
  }
}

export class AddressUpdateException extends ApiException {
  constructor() {
    super(ApiCodeResponse.ADDRESS_UPDATE_ERROR, 200);
  }
}
