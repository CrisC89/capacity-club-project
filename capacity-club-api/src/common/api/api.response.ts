import { ApiCodeResponse } from './api-code.response';
// Interface for standard API response structure.
export interface ApiResponse {
  result: boolean;
  code: ApiCodeResponse;
  data: any;
}
