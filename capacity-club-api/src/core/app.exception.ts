import { ApiCodeResponse, ApiException } from '@common/api';
export class TestException extends ApiException {
  constructor() {
    super(ApiCodeResponse.TEST, 200);
  }
}
