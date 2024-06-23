import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpException,
} from '@nestjs/common';
import { Response } from 'express';

// Exception filter for handling HTTP exceptions.
@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
  /**
   * Handle the caught HTTP exception.
   * @param exception - The caught HttpException.
   * @param host - The arguments host containing the context of the exception.
   */
  catch(exception: HttpException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    response.status(exception.getStatus()).json(exception.getResponse());
  }
}
