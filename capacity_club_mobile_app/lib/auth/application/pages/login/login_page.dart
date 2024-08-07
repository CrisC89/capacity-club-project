import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/login/view_states/login_loaded_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/dependency_injection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = serviceLocator<LoginBloc>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (_) => _loginBloc,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(child: LoginLoadedView(loginBloc: _loginBloc)))));
  }
}
