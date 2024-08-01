import { Credential } from '@auth/model';
import { TokenService } from '@auth/jwt/token.service';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { isNil } from 'lodash';
import { Repository } from 'typeorm';
import {
  RefreshTokenPayload,
  SignInPayload,
  SignupPayload,
  Token,
} from './model';
import { comparePassword, encryptPassword } from './utils';
import { Builder } from 'builder-pattern';
import { UniqueId } from '@common/model/unique-id';
import {
  CredentialDeleteException,
  SignupException,
  UserAlreadyExistException,
  UserNotFoundException,
} from './auth.exception';
import { CredentialUpdatepPayload } from './model/payload/credential-update.payload';

@Injectable()
export class AuthService {
  // Logger for logging messages.
  private readonly logger = new Logger(AuthService.name);

  constructor(
    @InjectRepository(Credential)
    private readonly repository: Repository<Credential>,
    private readonly tokenService: TokenService,
  ) {}

  /**
   * Retrieves credential details by id or throws UserNotFoundException if not found.
   * @param id - The credential ID to retrieve.
   * @returns The found credential.
   */
  async detail(id: string): Promise<Credential> {
    const result = await this.repository.findOneBy({
      credential_id: id,
    });
    if (!isNil(result)) {
      return result;
    }
    throw new UserNotFoundException();
  }

  /**
   * Handles the sign-in process for both social (Facebook and Google) and regular logins.
   * @param payload - The sign-in payload containing login details.
   * @param isAdmin - Indicates if the user is an admin.
   * @returns The authentication token if sign-in is successful.
   * @throws UserNotFoundException if user is not found or password mismatch.
   */
  async signIn(
    payload: SignInPayload,
    isAdmin: boolean,
  ): Promise<Token | null> {
    let result = null;
    if (payload.socialLogin) {
      if (!isNil(payload.facebookHash) && payload.facebookHash.length > 0) {
        result = await this.repository.findOneBy({
          facebookHash: payload.facebookHash,
          is_admin: isAdmin,
        });
      } else if (!isNil(payload.googleHash) && payload.googleHash.length > 0) {
        result = await this.repository.findOneBy({
          googleHash: payload.googleHash,
          is_admin: isAdmin,
        });
      }
    } else {
      result = await this.repository.findOneBy({
        username: payload.username,
        is_admin: isAdmin,
      });
    }

    if (
      !isNil(result) &&
      (payload.socialLogin ||
        (await comparePassword(payload.password, result.password)))
    ) {
      return this.tokenService.getTokens(result);
    }
    throw new UserNotFoundException();
  }

  /**
   * Handles new user registration and returns an authentication token.
   * @param payload - The signup payload containing registration details.
   * @returns The authentication token after successful signup.
   * @throws UserAlreadyExistException if the username is already taken.
   * @throws SignupException if there is an error during signup.
   */
  async signup(payload: SignupPayload): Promise<Token | null> {
    const result: Credential | null = await this.repository.findOneBy({
      username: payload.username,
    });

    if (!isNil(result)) {
      throw new UserAlreadyExistException();
    }

    try {
      const encryptedPassword =
        payload.facebookHash == '' && payload.googleHash == ''
          ? await encryptPassword(payload.password)
          : '';
      const response = await this.repository.save(
        Builder<Credential>()
          .credential_id(UniqueId.generate())
          .password(encryptedPassword)
          .facebookHash(payload.facebookHash)
          .googleHash(payload.googleHash)
          .username(payload.username)
          .build(),
      );
      const signInPayload: SignInPayload = {
        ...payload,
        socialLogin: !(payload.facebookHash == '' && payload.googleHash == ''),
      } as SignInPayload;
      return this.signIn(signInPayload, false);
    } catch (e) {
      this.logger.error(e.message);
      throw new SignupException();
    }
  }

  /**
   * Refreshes the authentication token using the provided refresh token payload.
   * @param payload - The refresh token payload.
   * @returns The new authentication token.
   */
  async refresh(payload: RefreshTokenPayload): Promise<Token | null> {
    return this.tokenService.refresh(payload);
  }

  /**
   * Links a Facebook account to the user's credentials.
   * @param payload - The payload containing the credential ID and Facebook hash.
   * @throws UserNotFoundException if the credential is not found.
   * @throws UserAlreadyExistException if the Facebook account is linked to another credential.
   */
  async linkFacebookAccount(payload: CredentialUpdatepPayload): Promise<void> {
    const credential = await this.repository.findOneBy({
      credential_id: payload.credential_id.toString(),
    });

    if (isNil(credential)) {
      throw new UserNotFoundException();
    }

    const existingCredential = await this.repository.findOneBy({
      facebookHash: payload.facebookHash,
    });

    if (!isNil(existingCredential)) {
      throw new UserAlreadyExistException();
    }

    credential.facebookHash = payload.facebookHash;
    await this.repository.save(credential);
  }

  /**
   * Links a Google account to the user's credentials.
   * @param payload - The payload containing the credential ID and Google hash.
   * @throws UserNotFoundException if the credential is not found.
   * @throws UserAlreadyExistException if the Google account is linked to another credential.
   */
  async linkGoogleAccount(payload: CredentialUpdatepPayload): Promise<void> {
    const credential = await this.repository.findOneBy({
      credential_id: payload.credential_id.toString(),
    });

    if (isNil(credential)) {
      throw new UserNotFoundException();
    }

    const existingCredential = await this.repository.findOneBy({
      googleHash: payload.googleHash,
    });

    if (!isNil(existingCredential)) {
      throw new UserAlreadyExistException();
    }

    credential.googleHash = payload.facebookHash;
    await this.repository.save(credential);
  }

  /**
   * Links a username and password to the user's credentials.
   * @param payload - The payload containing the credential ID, username, and password.
   * @throws UserNotFoundException if the credential is not found.
   * @throws UserAlreadyExistException if the username is already taken.
   */
  async linkUsername(payload: CredentialUpdatepPayload): Promise<void> {
    const credential = await this.repository.findOneBy({
      credential_id: payload.credential_id.toString(),
    });

    if (isNil(credential)) {
      throw new UserNotFoundException();
    }

    const existingCredential = await this.repository.findOneBy({
      username: payload.username,
    });

    if (!isNil(existingCredential)) {
      throw new UserAlreadyExistException();
    }

    credential.username = payload.username;
    await this.repository.save(credential);
  }

  /**
   * Links a member to the user's credentials.
   * @param payload - The payload containing the credential ID and member.
   * @throws UserNotFoundException if the credential is not found.
   * @throws UserAlreadyExistException if the member is already linked to another credential.
   */
  async linkUserMember(payload: CredentialUpdatepPayload): Promise<void> {
    const credential = await this.repository.findOneBy({
      credential_id: payload.credential_id.toString(),
    });

    if (isNil(credential)) {
      throw new UserNotFoundException();
    }
    const member = await payload.member;

    const memberIsAlreadyLinkToCredential = await this.repository.findOne({
      where: {
        member: {
          member_id: member.member_id.toString(),
        },
      },
    });

    if (!isNil(memberIsAlreadyLinkToCredential)) {
      throw new UserAlreadyExistException();
    }

    credential.member = Promise.resolve(payload.member);
    await this.repository.save(credential);
  }

  /**
   * Updates the password for the user's credentials.
   * @param payload - The payload containing the credential ID and new password.
   * @throws UserNotFoundException if the credential is not found.
   */
  async updatePassword(payload: CredentialUpdatepPayload): Promise<void> {
    const credential = await this.repository.findOneBy({
      credential_id: payload.credential_id.toString(),
    });

    if (isNil(credential)) {
      throw new UserNotFoundException();
    }

    credential.password = await encryptPassword(payload.password);
    await this.repository.save(credential);
  }

  /**
   * Deletes a user and their associated tokens.
   * @param id - The ID of the user to delete.
   * @throws CredentialDeleteException if deletion fails.
   */
  async delete(id): Promise<void> {
    try {
      const detail = await this.detail(id);
      await this.tokenService.deleteFor(detail);
      await this.repository.remove(detail);
    } catch (e) {
      throw new CredentialDeleteException();
    }
  }
}
