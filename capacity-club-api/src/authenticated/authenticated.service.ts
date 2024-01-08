import { TokenService } from '@authenticated/jwt/token.service';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  CredentialDeleteException,
  SignupException,
  UserAlreadyExistException,
  UserNotFoundException,
} from './authenticated.exception';
import {
  Credential,
  RefreshTokenPayload,
  SignInPayload,
  SignupPayload,
  Token,
} from './model';
import { comparePassword, encryptPassword } from './utils';
import { Builder } from 'builder-pattern';
import { ulid } from 'ulid';

@Injectable()
export class AuthenticatedService {
  // Logger for logging messages.
  private readonly logger = new Logger();

  constructor(
    @InjectRepository(Credential)
    private readonly repository: Repository<Credential>,
    private readonly tokenService: TokenService,
  ) {}

  // Retrieves credential details by id or throws UserNotFoundException if not found.
  async detail(id: string): Promise<Credential> {
    const result = await this.repository.findOneBy({ credential_id: id });
    if (!isNil(result)) {
      return result;
    }
    throw new UserNotFoundException();
  }

  // Handles the sign-in process for both social (Facebook and Google) and regular logins.
  async signIn(
    payload: SignInPayload,
    isAdmin: boolean,
  ): Promise<Token | null> {
    let result = null;
    // Handle social login
    if (payload.socialLogin) {
      // Check if it's a Facebook login and facebookHash is provided.
      if (!isNil(payload.facebookHash) && payload.facebookHash.length > 0) {
        // Find the user by Facebook hash and admin status.
        result = await this.repository.findOneBy({
          facebookHash: payload.facebookHash,
          isAdmin: isAdmin,
        });
      }
      // Check if it's a Google login and googleHash is provided.
      else if (!isNil(payload.googleHash) && payload.googleHash.length > 0) {
        // Find the user by Google hash and admin status.
        result = await this.repository.findOneBy({
          googleHash: payload.googleHash,
          isAdmin: isAdmin,
        });
      }
    } else {
      // Handle regular login
      // Find the user by email and admin status.
      result = await this.repository.findOneBy({
        mail: payload.mail,
        isAdmin: isAdmin,
      });
    }

    // Validate user and password, generate tokens if valid.
    if (
      !isNil(result) &&
      (payload.socialLogin ||
        (await comparePassword(payload.password, result.password)))
    ) {
      return this.tokenService.getTokens(result);
    }
    // Throw an exception if user not found or password mismatch.
    throw new UserNotFoundException();
  }

  // Handles new user registration and returns an authentication token.
  async signup(payload: SignupPayload): Promise<Token | null> {
    const result: Credential | null = await this.repository.findOneBy({
      mail: payload.mail,
    });

    // Check if user already exists and throw an exception if so.
    if (!isNil(result)) {
      throw new UserAlreadyExistException();
    }

    this.logger.log('googleHash');
    this.logger.log(isNil(payload.facebookHash));
    try {
      // Encrypt password for regular signup, leave empty for social login.
      //with isNill we don't check if the value is empty string
      const encryptedPassword =
        payload.facebookHash == '' && payload.googleHash == ''
          ? await encryptPassword(payload.password)
          : '';
      // Create new user credential and save to repository.
      const response = await this.repository.save(
        Builder<Credential>()
          .credential_id(ulid())
          .username(payload.username)
          .password(encryptedPassword)
          .facebookHash(payload.facebookHash)
          .googleHash(payload.googleHash)
          .mail(payload.mail)
          .build(),
      );
      // Prepare payload for sign-in after successful signup.
      const signInPayload: SignInPayload = {
        ...payload,
        socialLogin: !(payload.facebookHash == '' && payload.googleHash == ''),
      } as SignInPayload;

      this.logger.log('response');
      this.logger.log(response);
      this.logger.log('signin payload');
      this.logger.log(signInPayload);
      // Auto sign-in the user after successful registration.
      return this.signIn(signInPayload, false);
    } catch (e) {
      // Log the error and throw a signup exception.
      this.logger.error(e.message);
      throw new SignupException();
    }
  }

  // Refreshes the authentication token using the provided refresh token payload.
  async refresh(payload: RefreshTokenPayload): Promise<Token | null> {
    return this.tokenService.refresh(payload);
  }

  // Deletes a user and their associated tokens.
  async delete(id): Promise<void> {
    try {
      // Retrieve user details to be deleted.
      const detail = await this.detail(id);
      // Delete associated tokens and user credentials.
      await this.tokenService.deleteFor(detail);
      await this.repository.remove(detail);
    } catch (e) {
      // Throw an exception if deletion fails.
      throw new CredentialDeleteException();
    }
  }
}
