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
} from '../common/documentation/swagger.annotations';
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
  constructor(private readonly service: AuthService) {}

  /**
   * Handles user sign-in.
   * @param payload - The sign-in payload containing login details.
   * @returns The authentication token if sign-in is successful.
   */
  @ApiOperation(AuthenticatedControllerSignIn)
  @Public()
  @Post('signin')
  public signIn(@Body() payload: SignInPayload) {
    return this.service.signIn(payload, false);
  }

  /**
   * Handles admin sign-in.
   * @param payload - The sign-in payload containing login details.
   * @returns The authentication token if sign-in is successful.
   */
  @ApiOperation(AuthenticatedControllerAdminSignIn)
  @Public()
  @Post('admin-signin')
  public adminSignIn(@Body() payload: SignInPayload) {
    return this.service.signIn(payload, true);
  }

  /**
   * Handles user signup.
   * @param payload - The signup payload containing registration details.
   * @returns The authentication token after successful signup.
   */
  @ApiOperation(AuthenticatedControllerSignUp)
  @Public()
  @Post('signup')
  public signUp(@Body() payload: SignupPayload) {
    return this.service.signup(payload);
  }

  /**
   * Refreshes the authentication token.
   * @param payload - The refresh token payload.
   * @returns The new authentication token.
   */
  @ApiOperation(AuthenticatedControllerRefresh)
  @Public()
  @Post('refresh')
  public refresh(@Body() payload: RefreshTokenPayload) {
    return this.service.refresh(payload);
  }

  /**
   * Retrieves the current authenticated user's details.
   * @param user - The current authenticated user.
   * @returns The user's details.
   */
  @ApiOperation(AuthenticatedControllerMe)
  @Get('me')
  public me(@User() user: Credential) {
    return user;
  }

  /**
   * Links a Facebook account to the user's credentials.
   * @param payload - The payload containing the credential ID and Facebook hash.
   * @returns A success message if linking is successful.
   */
  @ApiOperation(AuthenticatedControllerLinkGoogleAccount)
  @Public()
  @Post('link-facebook')
  public linkFacebookAccount(@Body() payload: CredentialUpdatepPayload) {
    return this.service.linkFacebookAccount(payload);
  }

  /**
   * Links a Google account to the user's credentials.
   * @param payload - The payload containing the credential ID and Google hash.
   * @returns A success message if linking is successful.
   */
  @ApiOperation(AuthenticatedControllerLinkFacebookAccount)
  @Public()
  @Post('link-google')
  public linkGoogleAccount(@Body() payload: CredentialUpdatepPayload) {
    return this.service.linkGoogleAccount(payload);
  }

  /**
   * Links a username and password to the user's credentials.
   * @param payload - The payload containing the credential ID, username, and password.
   * @returns A success message if linking is successful.
   */
  @ApiOperation(AuthenticatedControllerLinkUsername)
  @Public()
  @Post('link-username')
  public linkUsername(@Body() payload: CredentialUpdatepPayload) {
    return this.service.linkUsername(payload);
  }

  /**
   * Deletes a user and their associated tokens.
   * @param id - The ID of the user to delete.
   * @returns A success message if deletion is successful.
   */
  @ApiOperation(AuthenticatedControllerDelete)
  @Delete('delete/:id')
  public delete(@Param('id') id: string) {
    return this.service.delete(id);
  }
}
