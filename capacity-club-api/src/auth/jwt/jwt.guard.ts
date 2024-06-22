import {
  TokenExpiredException,
  NoTokenFoundedException,
} from '@auth/auth.exception';
import { AuthService } from '@auth/auth.service';
import { Credential } from '@auth/model';
import { IS_PUBLIC_KEY } from '@common/config';
import {
  Injectable,
  CanActivate,
  Logger,
  ExecutionContext,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { JwtService } from '@nestjs/jwt';
import { isNil } from 'lodash';
import { Observable, from, map } from 'rxjs';

@Injectable()
export class JwtGuard implements CanActivate {
  private readonly logger = new Logger(JwtGuard.name);

  constructor(
    private readonly jwtService: JwtService,
    private readonly authService: AuthService,
    private reflector: Reflector,
  ) {}
  /**
   * Main guard method to check if the request is authorized.
   * @param context - The execution context of the request.
   * @returns A boolean or a Promise/Observable of boolean indicating if the request is authorized.
   */
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    const isPublic = this.reflector.getAllAndOverride<boolean>(IS_PUBLIC_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);
    return isPublic
      ? true
      : this.validateToken(context.switchToHttp().getRequest());
  }
  /**
   * Method to validate JWT token.
   * @param request - The HTTP request object.
   * @returns An Observable of boolean indicating if the token is valid.
   * @throws TokenExpiredException if the token is expired.
   * @throws NoTokenFoundedException if no token is found.
   */
  private validateToken(request: any): Observable<boolean> {
    console.log('Enter validate token');
    // Check if authorization header is present
    if (!isNil(request.headers['authorization'])) {
      try {
        // Extract credential_id from JWT token
        const id = this.jwtService.verify(
          request.headers['authorization'].replace('Bearer ', ''),
        ).sub;
        // Retrieve credential details and set in request
        return from(this.authService.detail(id)).pipe(
          map((user: Credential) => {
            request.user = user;
            return true;
          }),
        );
      } catch (e) {
        // Log error and throw token expired exception
        this.logger.log(e.message);
        throw new TokenExpiredException();
      }
    }
    // Log error and throw token expired exception
    throw new NoTokenFoundedException();
  }
}
