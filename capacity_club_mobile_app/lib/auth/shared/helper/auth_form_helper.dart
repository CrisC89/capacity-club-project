import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_up_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/model/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/model/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/core/config/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/core/provider/theme_provider.dart';
import 'package:capacity_club_mobile_app/core/widgets/button/black_botton_widget.dart';
import 'package:capacity_club_mobile_app/core/widgets/text-label/text_field_with_icon_widgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthFormHelper {
  static Widget getSignupForm(
      FormGroup form, Function signUp, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            textFieldWithIcon(FontAwesomeIcons.user, 'username',
                AppLocale.label_username.getString(context), false, {
              'required': (error) =>
                  AppLocale.username_required.getString(context),
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
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            textFieldWithIcon(
              FontAwesomeIcons.eye,
              'confirmation',
              AppLocale.label_password_confirmation.getString(context),
              true,
              {
                'mustMatch': (error) =>
                    'local.signup_screen_error_passwords_required'
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            blackButton(AppLocale.sign_up.getString(context), signUp,
                themeProvider.isDarkModeOn)
          ],
        ));
  }

  static Widget getSignInForm(
      FormGroup form, Function signUp, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            textFieldWithIcon(FontAwesomeIcons.user, 'username',
                AppLocale.label_username.getString(context), false, {
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
            blackButton(AppLocale.sign_in.getString(context), signUp,
                themeProvider.isDarkModeOn)
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

  static SignUpRequest fromSignupForm(FormGroup form) {
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
