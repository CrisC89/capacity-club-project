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
  // Handle the caught HTTP exception.
  catch(exception: HttpException, host: ArgumentsHost) {
    // Extract HTTP context and response object.
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    // Respond with the exception's status and details.
    response.status(exception.getStatus()).json(exception.getResponse());
  }
}
