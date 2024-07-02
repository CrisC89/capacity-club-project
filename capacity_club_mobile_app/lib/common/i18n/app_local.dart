import 'package:capacity_club_mobile_app/common/i18n/i18n_en.dart';
import 'package:capacity_club_mobile_app/common/i18n/i18n_fr.dart';

mixin AppLocale {
  static const String sign_in = 'sign_in';
  static const String sign_up = 'sign_up';
  static const String forgot_password = 'forgot_password';
  static const String label_username = 'label_username';
  static const String label_mail = 'label_mail';
  static const String label_password = 'label_password';
  static const String label_password_confirmation =
      'label_password_confirmation';
  static const String mail_required = 'mail_required';
  static const String username_required = 'username_required';
  static const String password_required = 'password_required';
  static const String password_error_min_length = 'password_error_min_length';
  static const String email_format_error = 'email_format_error';
  static const String dont_have_account = 'dont_have_account';
  static const String already_have_account = 'already_have_account';
  static const String or_connect_with = 'or_connect_with';
  static const String or_register_with = 'or_register_with';

  static const Map<String, dynamic> enTranslation = i18nEn;
  static const Map<String, dynamic> frTranslation = i18nFr;
}
