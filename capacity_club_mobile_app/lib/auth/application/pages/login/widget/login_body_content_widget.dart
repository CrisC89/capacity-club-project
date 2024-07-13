import 'dart:ui';

import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/model/request/sign_in_request.dart';
import 'package:capacity_club_mobile_app/auth/shared/helper/auth_form_helper.dart';
import 'package:capacity_club_mobile_app/auth/shared/widgets/social_rouded_button_widget.dart';
import 'package:capacity_club_mobile_app/core/config/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/core/provider/theme_provider.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

Widget loginBodyContent(BuildContext context, FormGroup form) {
  _loginByUsername(SignInRequest signInRequest) {
    context
        .read<LoginBloc>()
        .add(LoginByUsernameEvent(signInRequest: signInRequest));
  }

  _loginByGoogle() {
    context.read<LoginBloc>().add(LoginByGoogleEvent());
  }

  _loginByFacebook() {
    context.read<LoginBloc>().add(LoginByFacebookEvent());
  }

  final colorScheme = Theme.of(context).colorScheme;
  return Container(
    color: colorScheme.surface,
    height: MediaQuery.of(context).size.height * 0.6,
    padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.fixPadding * 1.5, vertical: AppTheme.fixPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTheme.heightSpace50,
        Text(AppLocale.sign_in.getString(context),
            style: AppTheme.titleTextStyle, textAlign: TextAlign.center),
        AppTheme.heightSpace30,
        appLogo(context),
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
        Column(
          children: [
            Row(mainAxisSize: MainAxisSize.max, children: [
              const Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  AppLocale.or_connect_with.getString(context),
                  style: AppTheme.dustyGrayMedium16,
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ]),
            AppTheme.heightSpace5,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialRoundedButton(
                    assetImage: 'assets/img/facebook.png',
                    size: 19,
                    onPressed: _loginByFacebook),
                SocialRoundedButton(
                    assetImage: 'assets/img/google.png',
                    size: 19,
                    onPressed: _loginByGoogle),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
