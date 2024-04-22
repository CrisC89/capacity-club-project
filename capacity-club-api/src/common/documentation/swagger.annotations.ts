import { ApiOperationOptions } from '@nestjs/swagger';
/*------------------------------------*/
/*----- Authenticated Controller -----*/
/*------------------------------------*/

export const AuthenticatedControllerSignIn: ApiOperationOptions = {
  summary: 'SignIn',
  description: 'Method for user sign in',
};

export const AuthenticatedControllerAdminSignIn: ApiOperationOptions = {
  summary: 'Admin SignIn',
  description: 'Method for admin sign in',
};

export const AuthenticatedControllerSignUp: ApiOperationOptions = {
  summary: 'Sign Up',
  description: 'Method for user sign up',
};

export const AuthenticatedControllerRefresh: ApiOperationOptions = {
  summary: 'Refresh',
  description: 'Method for refreshing the auth token',
};

export const AuthenticatedControllerMe: ApiOperationOptions = {
  summary: 'Me',
  description: "Get current user's information",
};

export const AuthenticatedControllerDelete: ApiOperationOptions = {
  summary: 'Delete',
  description: 'Method to delete a credential by id',
};

/*------------------------------------*/
/*-------- Member Controller ---------*/
/*------------------------------------*/

export const MemberControllerCreate: ApiOperationOptions = {
  summary: 'Create',
  description: 'Create a new member',
};

export const MemberControllerDetail: ApiOperationOptions = {
  summary: 'Detail',
  description: 'Get a member by id',
};

export const MemberControllerList: ApiOperationOptions = {
  summary: 'List',
  description: 'Get all members',
};

export const MemberControllerUpdate: ApiOperationOptions = {
  summary: 'Update',
  description: 'Update a member',
};

export const MemberControllerDelete: ApiOperationOptions = {
  summary: 'Delete',
  description: 'Delete a member by id',
};

export const MemberControllerFilter: ApiOperationOptions = {
  summary: 'Filter',
  description: 'Get a filtered list of member',
};
