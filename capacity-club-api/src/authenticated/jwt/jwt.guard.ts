import {
  TokenExpiredException,
  NoTokenFoundedException,
} from '@authenticated/authenticated.exception';
import { AuthenticatedService } from '@authenticated/authenticated.service';
import { Credential } from '@authenticated/model';
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
    private readonly authenticatedService: AuthenticatedService,
    private reflector: Reflector,
  ) {}
  // Main guard method to check if the request is authorized
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    //Here we check if route have @Public decorator;
    const isPublic = this.reflector.getAllAndOverride<boolean>(IS_PUBLIC_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);
    // If public, allow access; otherwise validate the JWT token
    return isPublic
      ? true
      : this.validateToken(context.switchToHttp().getRequest());
  }
  // Method to validate JWT token
  private validateToken(request: any): Observable<boolean> {
    // Check if authorization header is present
    if (!isNil(request.headers['authorization'])) {
      try {
        // Extract credential_id from JWT token
        const id = this.jwtService.verify(
          request.headers['authorization'].replace('Bearer ', ''),
        ).sub;
        // Retrieve credential details and set in request
        return from(this.authenticatedService.detail(id)).pipe(
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
