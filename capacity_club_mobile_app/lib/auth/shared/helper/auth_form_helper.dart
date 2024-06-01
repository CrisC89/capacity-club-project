import 'package:capacity_club_mobile_app/auth/data/builder/sign_in_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/builder/sign_up_request_builder.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/common/widgets/black_botton_widget.dart';
import 'package:capacity_club_mobile_app/common/widgets/text_field_with_icon_widgt.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthFormHelper {
  static Widget getSignupForm(FormGroup form, Function signUp) {
    return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            textFieldWithIcon(Icons.verified_user_outlined, 'mail',
                'local.signup_screen_label_username', false, {
              'required': (error) =>
                  ' local.signup_screen_error_username_required',
              'email': (error) => 'local.signup_screen_error_username_email'
            }),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            textFieldWithIcon(
              Icons.lock_clock,
              'password',
              'local.signup_screen_label_password',
              true,
              {
                'required': (error) =>
                    'local.signup_screen_error_password_required',
                'minLength': (error) =>
                    'local.signup_screen_error_password_minLength'
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

  static Widget getSignInForm(FormGroup form, Function signUp) {
    return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            textFieldWithIcon(Icons.supervised_user_circle, 'mail',
                'local.signup_screen_label_username', false, {
              'required': (error) =>
                  'local.signup_screen_error_username_required',
              'email': (error) => 'local.signup_screen_error_username_email'
            }),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            textFieldWithIcon(
              Icons.cabin,
              'password',
              'local.signup_screen_label_password',
              true,
              {
                'required': (error) =>
                    'local.signup_screen_error_password_required',
                'minLength': (error) =>
                    'local.signup_screen_error_password_minLength'
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            blackButton('local.signin_screen_button', signUp)
          ],
        ));
  }

  static SignInRequest fromSignInForm(FormGroup form) {
    SignInRequestBuilder builder = SignInRequestBuilder();
    for (var value in form.value.entries) {
      switch (value.key) {
        case 'mail':
          builder = builder.setMail(value.value as String);
          break;
        case 'password':
          builder = builder.setPassword(value.value as String);
          break;
      }
    }
    return builder.build();
  }

  static SignupRequest fromSignupForm(FormGroup form) {
    SignupRequestBuilder builder = SignupRequestBuilder();
    for (var value in form.value.entries) {
      switch (value.key) {
        case 'mail':
          builder = builder.setMail(value.value as String);
          break;
        case 'password':
          builder = builder.setPassword(value.value as String);
          break;
      }
    }
    return builder.build();
  }
}
