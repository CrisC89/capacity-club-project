import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_up_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/common/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/common/widgets/button/black_botton_widget.dart';
import 'package:capacity_club_mobile_app/common/widgets/text-label/text_field_with_icon_widgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthFormHelper {
  static Widget getSignupForm(
      FormGroup form, Function signUp, BuildContext context) {
    return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            textFieldWithIcon(Icons.verified_user_outlined, 'username',
                AppLocale.label_mail.getString(context), false, {
              'required': (error) => AppLocale.mail_required.getString(context),
            }),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            textFieldWithIcon(
              Icons.lock_clock,
              'password',
              AppLocale.label_password,
              true,
              {
                'required': (error) =>
                    AppLocale.password_required.getString(context),
                'minLength': (error) =>
                    AppLocale.password_error_min_length.getString(context)
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            textFieldWithIcon(
              Icons.lock_clock,
              'confirmation',
              'local.signup_screen_label_confirmation',
              true,
              {
                'mustMatch': (error) =>
                    'local.signup_screen_error_passwords_required'
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            blackButton('local.signup_screen_button', signUp)
          ],
        ));
  }

  static Widget getSignInForm(
      FormGroup form, Function signUp, BuildContext context) {
    return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            textFieldWithIcon(FontAwesomeIcons.user, 'username',
                AppLocale.label_mail.getString(context), false, {
              'required': (error) => AppLocale.mail_required.getString(context),
            }),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            textFieldWithIcon(
              FontAwesomeIcons.eye,
              'password',
              AppLocale.label_password.getString(context),
              true,
              {
                'required': (error) =>
                    AppLocale.password_required.getString(context),
                'minLength': (error) =>
                    AppLocale.password_error_min_length.getString(context)
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            blackButton(AppLocale.sign_in.getString(context), signUp)
          ],
        ));
  }

  static SignInRequest fromSignInForm(FormGroup form) {
    SignInRequestBuilder builder = SignInRequestBuilder();
    for (var value in form.value.entries) {
      switch (value.key) {
        case 'username':
          builder = builder.setUsername(value.value as String);
          break;
        case 'password':
          builder = builder.setPassword(value.value as String);
          break;
      }
    }
    return builder.build();
  }

  static SignupRequest fromSignupForm(FormGroup form) {
    SignUpRequestBuilder builder = SignUpRequestBuilder();
    for (var value in form.value.entries) {
      switch (value.key) {
        case 'username':
          builder = builder.setUsername(value.value as String);
          break;
        case 'password':
          builder = builder.setPassword(value.value as String);
          break;
      }
    }
    return builder.build();
  }
}
