import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { AuthenticatedService } from './authenticated.service';
import { Public } from '@common/config/metadata/public.metadata';
import {
  SignInPayload,
  SignupPayload,
  RefreshTokenPayload,
  Credential,
} from './model';
import { User } from '@common/config/metadata/user.metadata';

// Decorators for Swagger documentation and setting up the controller for API routes
@ApiBearerAuth('access-token')
@ApiTags('Authenticated')
@Controller('authenticated')
export class AuthenticatedController {
  // Dependency injection of AuthenticatedService
  constructor(private readonly service: AuthenticatedService) {}

  // POST method for user sign in
  @Public()
  @Post('signin')
  public signIn(@Body() payload: SignInPayload) {
    return this.service.signIn(payload, false);
  }

  // POST method for admin sign in
  @Public()
  @Post('admin-signin')
  public adminSignIn(@Body() payload: SignInPayload) {
    return this.service.signIn(payload, true);
  }

  // POST method for user sign up
  @Public()
  @Post('signup')
  public signUp(@Body() payload: SignupPayload) {
    return this.service.signup(payload);
  }

  // POST method for refreshing the auth token
  @Public()
  @Post('refresh')
  public refresh(@Body() payload: RefreshTokenPayload) {
    return this.service.refresh(payload);
  }

  // GET method to get current user's information
  @Get('me')
  public me(@User() user: Credential) {
    return user;
  }

  // DELETE method to delete a user by their ID
  @Delete('delete/:id')
  public delete(@Param('id') id: string) {
    return this.service.delete(id);
  }
}
