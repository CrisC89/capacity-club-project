import 'package:capacity_club_mobile_app/auth/application/core/view/auth_flow_loading_view.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/login/view_states/login_loaded_view.dart';
import 'package:capacity_club_mobile_app/auth/domain/usecase/auth_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/dependency_injection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
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
            create: (_) => serviceLocator<LoginBloc>(),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(child: const LoginLoadedView()))));
  }
}
/*
 BlocBuilder<LoginBloc, LoginGenericState>(
                        buildWhen: (current, previous) =>
                            current.email != previous.email,
                        builder: (context, state) {
                          return TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            focusNode: emailFocusNode,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(
                                  50), // Limite à 50 caractères
                            ],
                            onChanged: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginMailChangedEvent(email: value));
                            },
                          );
                        }),
                    const SizedBox(height: 16),
                    BlocBuilder<LoginBloc, LoginGenericState>(
                        buildWhen: (current, previous) =>
                            current.password != previous.password,
                        builder: (context, state) {
                          return TextFormField(
                            focusNode: passwordFocusNode,
                            decoration: const InputDecoration(
                              labelText: 'password',
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(
                                  50), // Limite à 50 caractères
                            ],
                            onChanged: (value) {
                              context.read<LoginBloc>().add(
                                  LoginPasswordChangedEvent(password: value));
                            },
                          );
                        }),
                    const SizedBox(height: 16),
                    BlocListener<LoginBloc, LoginGenericState>(
                      listener: (context, state) {
                        if (state.status == LoginStatus.error) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text(state.message.toString())));
                        } else if (state.status == LoginStatus.loading) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                const SnackBar(content: Text('Submitting')));
                        } else if (state.status == LoginStatus.succes) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                const SnackBar(content: Text('Login success')));
                        }
                      },
                      child: BlocBuilder<LoginBloc, LoginGenericState>(
                          buildWhen: (current, previous) => false,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(LoginByMailEvent());
                              },
                              child: const Text('Login'),
                            );
                          }),
                    )
 
  */
