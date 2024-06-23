import {
  Injectable,
  NestInterceptor,
  Logger,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { isNil } from 'lodash';
import { Observable, map } from 'rxjs';
import { configManager, ConfigKey } from '..';
import { ApiCodeResponse } from './api-code.response';
import { instanceToPlain } from 'class-transformer';

@Injectable()
export class ApiInterceptor implements NestInterceptor {
  //Logger for logging messages
  private readonly logger = new Logger(ApiInterceptor.name);

  /**
   * Intercepts the request and response to format the API response.
   * @param context - The execution context of the request.
   * @param next - The next handler in the request pipeline.
   * @returns The formatted response.
   */
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    const ctx = context.switchToHttp();
    const path = ctx.getRequest().route.path;
    return next.handle().pipe(
      map((response: any) => {
        return {
          code: this.map(path),
          data: instanceToPlain(response),
          result: true,
        };
      }),
    );
  }

  /**
   * Maps the request path to a specific API response code.
   * @param path - The request path.
   * @returns The corresponding API response code.
   */
  map(path: string): ApiCodeResponse {
    this.logger.log(`path ${path}`);
    const part = path
      .replace(configManager.getValue(ConfigKey.APP_BASE_URL), '')
      .split('/')
      .filter((s) => s.length > 0)
      .slice(0, 2)
      .map((s) => s.toUpperCase());
    const code =
      ApiCodeResponse[
        `${part.join('_')}_SUCCESS` as keyof typeof ApiCodeResponse
      ];
    return isNil(code) ? ApiCodeResponse.COMMON_SUCCESS : code;
  }
}
