class MessageHelper {
  String messageFromCode(String code) {
    switch (code) {
      case 'USER_ALREADY_EXIST':
        return 'translateService.locale.api_user_already_exist';
      case 'TOKEN_EXPIRED':
        return 'translateService.locale.api_token_expired';
      case 'USER_NOT_FOUND':
        return 'translateService.locale.api_signin_error_user_not_found';
      case 'SYSTEM_ERROR':
        return 'translateService.locale.api_system_error';
      default:
        return code;
    }
  }
}
