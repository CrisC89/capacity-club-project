import 'dart:ui';

import 'package:capacity_club_mobile_app/auth/shared/helper/auth_form_helper.dart';
import 'package:capacity_club_mobile_app/auth/shared/widgets/social_rouded_button_widget.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:capacity_club_mobile_app/common/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

Widget loginBodyContent(Size size, FormGroup form) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.fixPadding * 1.5, vertical: AppTheme.fixPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTheme.heightSpace50,
        Text('local.signIn.getString(context)',
            style: AppTheme.blackBold16, textAlign: TextAlign.center),
        AppTheme.heightSpace30,
        appLogo(),
        AppTheme.heightSpace30,
        AuthFormHelper.getSignInForm(form, () {
          if (form.valid) {
            // Handle sign in
            final signInRequest = AuthFormHelper.fromSignInForm(form);
            // Utilisez signInRequest pour vos besoins de connexion
          } else {
            form.markAllAsTouched();
          }
        }),
        AppTheme.heightSpace20,
        Text(
          ' local.orConnectWith',
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
