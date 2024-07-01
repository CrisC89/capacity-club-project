import 'dart:ui';

import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/shared/helper/auth_form_helper.dart';
import 'package:capacity_club_mobile_app/auth/shared/widgets/social_rouded_button_widget.dart';
import 'package:capacity_club_mobile_app/common/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:capacity_club_mobile_app/common/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:reactive_forms/reactive_forms.dart';

Widget loginBodyContent(BuildContext context, FormGroup form) {
  _loginByUsername(SignInRequest signInRequest) {
    context
        .read<LoginBloc>()
        .add(LoginByMailEvent(signInRequest: signInRequest));
  }

  final colorScheme = Theme.of(context).colorScheme;
  return Container(
    color: colorScheme.surface,
    height: MediaQuery.of(context).size.height * 0.6,
    padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.fixPadding * 1.5, vertical: AppTheme.fixPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTheme.heightSpace50,
        Text(AppLocale.sign_in.getString(context),
            style: AppTheme.blackBold16, textAlign: TextAlign.center),
        AppTheme.heightSpace30,
        appLogo(),
        AppTheme.heightSpace30,
        AuthFormHelper.getSignInForm(form, () {
          if (form.valid) {
            final SignInRequest signInRequest =
                AuthFormHelper.fromSignInForm(form);
            _loginByUsername(signInRequest);
          } else {
            form.markAllAsTouched();
          }
        }, context),
        AppTheme.heightSpace20,
        Text(
          AppLocale.or_connect_with.getString(context),
          style: AppTheme.dustyGrayMedium16,
          textAlign: TextAlign.center,
        ),
        AppTheme.heightSpace5,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialRoundedButton(
              assetImage: 'assets/img/facebook.png',
              size: 19,
            ),
            SocialRoundedButton(
              assetImage: 'assets/img/google.png',
              size: 19,
            ),
          ],
        ),
      ],
    ),
  );
}
