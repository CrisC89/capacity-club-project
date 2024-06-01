import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/login/widget/login_body_content_widget.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/login/widget/login_bottom_page_widget.dart';
import 'package:capacity_club_mobile_app/auth/shared/helper/auth_form_helper.dart';
import 'package:capacity_club_mobile_app/auth/shared/widgets/auth_logo_widget.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:capacity_club_mobile_app/auth/shared/widgets/social_rouded_button_widget.dart';
import 'package:capacity_club_mobile_app/common/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginLoadedView extends StatefulWidget {
  const LoginLoadedView({super.key, required this.loginBloc});
  final LoginBloc loginBloc;

  @override
  State<LoginLoadedView> createState() => _LoginLoadedViewState();
}

class _LoginLoadedViewState extends State<LoginLoadedView> {
  final FormGroup form = FormGroup({
    'mail': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)]),
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: loginBottomPage(context),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height * 0.9,
          ),
          child: IntrinsicHeight(
            child: loginBodyContent(context, form),
          ),
        ),
      ),
    );
  }
}
