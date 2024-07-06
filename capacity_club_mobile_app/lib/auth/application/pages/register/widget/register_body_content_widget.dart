import 'package:capacity_club_mobile_app/auth/application/pages/register/bloc/register_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/request/sign_up_request.dart';
import 'package:capacity_club_mobile_app/auth/shared/helper/auth_form_helper.dart';
import 'package:capacity_club_mobile_app/auth/shared/widgets/social_rouded_button_widget.dart';
import 'package:capacity_club_mobile_app/common/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:capacity_club_mobile_app/common/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:reactive_forms/reactive_forms.dart';

Widget registerBodyContent(BuildContext context, FormGroup form) {
  _registerByUsername(SignUpRequest signup) {
    context
        .read<RegisterBloc>()
        .add(RegisterByUsernameEvent(signUpRequest: signup));
  }

  _registerByGoogle() {
    context.read<RegisterBloc>().add(RegisterByGoogleEvent());
  }

  _registerByFacebook() {
    context.read<RegisterBloc>().add(RegisterByFacebookEvent());
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
        Text(AppLocale.sign_up.getString(context),
            style: AppTheme.titleTextStyle, textAlign: TextAlign.center),
        AppTheme.heightSpace30,
        appLogo(context),
        AppTheme.heightSpace30,
        AuthFormHelper.getSignupForm(form, () {
          if (form.valid) {
            final SignUpRequest signUnRequest =
                AuthFormHelper.fromSignupForm(form);
            _registerByUsername(signUnRequest);
          } else {
            form.markAllAsTouched();
          }
        }, context),
        AppTheme.heightSpace20,
        Column(children: [
          Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                AppLocale.or_register_with.getString(context),
                style: AppTheme.dustyGrayMedium16,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ]),
        ]),
        AppTheme.heightSpace5,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialRoundedButton(
                assetImage: 'assets/img/facebook.png',
                size: 19,
                onPressed: _registerByFacebook),
            SocialRoundedButton(
                assetImage: 'assets/img/google.png',
                size: 19,
                onPressed: _registerByGoogle),
          ],
        ),
      ],
    ),
  );
}
