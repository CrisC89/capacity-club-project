import {
  AuthenticatedControllerAdminSignIn,
  AuthenticatedControllerDelete,
  AuthenticatedControllerLinkFacebookAccount,
  AuthenticatedControllerLinkGoogleAccount,
  AuthenticatedControllerLinkUsername,
  AuthenticatedControllerMe,
  AuthenticatedControllerRefresh,
  AuthenticatedControllerSignIn,
  AuthenticatedControllerSignUp,
} from './../common/documentation/swagger.annotations';
import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { Public } from '@common/config/metadata/public.metadata';
import {
  SignInPayload,
  SignupPayload,
  RefreshTokenPayload,
  Credential,
} from './model';
import { User } from '@common/config/metadata/user.metadata';
import { AuthService } from './auth.service';
import { CredentialUpdatepPayload } from './model/payload/credential-update.payload';

// Decorators for Swagger documentation and setting up the controller for API routes
@ApiBearerAuth('access-token')
@ApiTags('Auth')
@Controller('auth')
export class AuthController {
  // Dependency injection of AuthenticatedService
  constructor(private readonly service: AuthService) {}

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

  @ApiOperation(AuthenticatedControllerLinkGoogleAccount)
  @Public()
  @Post('link-facebook')
  public linkFacebookAccount(@Body() payload: CredentialUpdatepPayload) {
    return this.service.linkFacebookAccount(payload);
  }

  @ApiOperation(AuthenticatedControllerLinkFacebookAccount)
  @Public()
  @Post('link-google')
  public linkGoogleAccount(@Body() payload: CredentialUpdatepPayload) {
    return this.service.linkFacebookAccount(payload);
  }

  @ApiOperation(AuthenticatedControllerLinkUsername)
  @Public()
  @Post('link-username')
  public linkUsername(@Body() payload: CredentialUpdatepPayload) {
    return this.service.linkUsername(payload);
  }

  //Method to delete a credential by id
  @ApiOperation(AuthenticatedControllerDelete)
  @Delete('delete/:id')
  public delete(@Param('id') id: string) {
    return this.service.delete(id);
  }
}
