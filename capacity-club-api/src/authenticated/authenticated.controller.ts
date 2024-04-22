import {
  AuthenticatedControllerAdminSignIn,
  AuthenticatedControllerDelete,
  AuthenticatedControllerMe,
  AuthenticatedControllerRefresh,
  AuthenticatedControllerSignIn,
  AuthenticatedControllerSignUp,
} from './../common/documentation/swagger.annotations';
import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
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

  //Method for user sign in
  @ApiOperation(AuthenticatedControllerSignIn)
  @Public()
  @Post('signin')
  public signIn(@Body() payload: SignInPayload) {
    return this.service.signIn(payload, false);
  }

  //Method for admin sign in
  @ApiOperation(AuthenticatedControllerAdminSignIn)
  @Public()
  @Post('admin-signin')
  public adminSignIn(@Body() payload: SignInPayload) {
    return this.service.signIn(payload, true);
  }

  //Method for user sign up
  @ApiOperation(AuthenticatedControllerSignUp)
  @Public()
  @Post('signup')
  public signUp(@Body() payload: SignupPayload) {
    return this.service.signup(payload);
  }

  //Method for refreshing the auth token
  @ApiOperation(AuthenticatedControllerRefresh)
  @Public()
  @Post('refresh')
  public refresh(@Body() payload: RefreshTokenPayload) {
    return this.service.refresh(payload);
  }

  //Get current user's information
  @ApiOperation(AuthenticatedControllerMe)
  @Get('me')
  public me(@User() user: Credential) {
    return user;
  }

  //Method to delete a credential by id
  @ApiOperation(AuthenticatedControllerDelete)
  @Delete('delete/:id')
  public delete(@Param('id') id: string) {
    return this.service.delete(id);
  }
}
