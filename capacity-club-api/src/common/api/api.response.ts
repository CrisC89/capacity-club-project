import { ApiCodeResponse } from './api-code.response';

/**
 * Interface for standard API response structure.
 * Defines the format of the response returned by the API.
 */
export interface ApiResponse {
  result: boolean;
  code: ApiCodeResponse;
  data: any;
}
