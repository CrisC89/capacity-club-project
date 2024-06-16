import { ApiOperationOptions } from '@nestjs/swagger';
/*------------------------------------*/
/*----- Authenticated Controller -----*/
/*------------------------------------*/

export const AuthenticatedControllerSignIn: ApiOperationOptions = {
  summary: 'User Sign-In',
  description:
    'Authenticate a user using their credentials and return an authentication token.',
};

export const AuthenticatedControllerAdminSignIn: ApiOperationOptions = {
  summary: 'Admin Sign-In',
  description:
    'Authenticate an admin user using their credentials and return an authentication token.',
};

export const AuthenticatedControllerSignUp: ApiOperationOptions = {
  summary: 'User Sign-Up',
  description:
    'Register a new user and return an authentication token upon successful registration.',
};

export const AuthenticatedControllerRefresh: ApiOperationOptions = {
  summary: 'Refresh Authentication Token',
  description: 'Refresh the authentication token using a valid refresh token.',
};

export const AuthenticatedControllerMe: ApiOperationOptions = {
  summary: 'Get Current User Information',
  description: "Retrieve the current authenticated user's profile information.",
};

export const AuthenticatedControllerDelete: ApiOperationOptions = {
  summary: 'Delete Credential',
  description:
    'Delete a user credential by its ID and remove associated authentication tokens.',
};

export const AuthenticatedControllerLinkGoogleAccount: ApiOperationOptions = {
  summary: 'Link Google Account',
  description:
    'Method for linking a Google account to an existing user account.',
};

export const AuthenticatedControllerLinkFacebookAccount: ApiOperationOptions = {
  summary: 'Link Facebook Account',
  description:
    'Method for linking a Facebook account to an existing user account.',
};

export const AuthenticatedControllerLinkUsername: ApiOperationOptions = {
  summary: 'Link Username and Password',
  description:
    'Method for linking a username and password to an existing user account.',
};

/*------------------------------------*/
/*-------- Member Controller ---------*/
/*------------------------------------*/

export const MemberControllerCreate: ApiOperationOptions = {
  summary: 'Create Member',
  description: 'Create a new member and store their details in the database.',
};

export const MemberControllerDetail: ApiOperationOptions = {
  summary: 'Get Member Details',
  description: 'Retrieve the details of a specific member by their ID.',
};

export const MemberControllerList: ApiOperationOptions = {
  summary: 'List All Members',
  description: 'Retrieve a list of all members stored in the database.',
};

export const MemberControllerUpdate: ApiOperationOptions = {
  summary: 'Update Member',
  description: 'Update the details of an existing member.',
};

export const MemberControllerDelete: ApiOperationOptions = {
  summary: 'Delete Member',
  description: 'Delete a specific member from the database by their ID.',
};

export const MemberControllerFilter: ApiOperationOptions = {
  summary: 'Filter Members',
  description:
    'Retrieve a list of members based on specific filtering criteria.',
};

export const MemberCardControllerCreate: ApiOperationOptions = {
  summary: 'Create MemberCard',
  description:
    'Create a new member card and store its details in the database.',
};

export const MemberCardControllerDetail: ApiOperationOptions = {
  summary: 'Get MemberCard Details',
  description: 'Retrieve the details of a specific member card by its ID.',
};

export const MemberCardControllerList: ApiOperationOptions = {
  summary: 'List All MemberCards',
  description: 'Retrieve a list of all member cards stored in the database.',
};

export const MemberCardControllerUpdate: ApiOperationOptions = {
  summary: 'Update MemberCard',
  description: 'Update the details of an existing member card.',
};

export const MemberCardControllerDelete: ApiOperationOptions = {
  summary: 'Delete MemberCard',
  description: 'Delete a specific member card from the database by its ID.',
};

export const MemberCardControllerFilter: ApiOperationOptions = {
  summary: 'Filter MemberCards',
  description:
    'Retrieve a list of member cards based on specific filtering criteria.',
};

export const AddressControllerCreate: ApiOperationOptions = {
  summary: 'Create Address',
  description: 'Create a new address and store its details in the database.',
};

export const AddressControllerDetail: ApiOperationOptions = {
  summary: 'Get Address Details',
  description: 'Retrieve the details of a specific address by its ID.',
};

export const AddressControllerList: ApiOperationOptions = {
  summary: 'List All Addresses',
  description: 'Retrieve a list of all addresses stored in the database.',
};

export const AddressControllerUpdate: ApiOperationOptions = {
  summary: 'Update Address',
  description: 'Update the details of an existing address.',
};

export const AddressControllerDelete: ApiOperationOptions = {
  summary: 'Delete Address',
  description: 'Delete a specific address from the database by its ID.',
};

export const AddressControllerFilter: ApiOperationOptions = {
  summary: 'Filter Addresses',
  description:
    'Retrieve a list of addresses based on specific filtering criteria.',
};
