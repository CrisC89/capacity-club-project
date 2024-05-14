import 'package:capacity_club_mobile_app/core/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/test-login.screen.dart';
import 'package:capacity_club_mobile_app/auth/unauthrouter.dart';
import 'package:capacity_club_mobile_app/core/init.page.dart';
import 'package:capacity_club_mobile_app/core/routing/go_router.dart';
import 'package:capacity_club_mobile_app/domain-features/test-auth.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthFlowPage extends StatelessWidget {
  const AuthFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthFlowBloc>(context).add(AuthFlowStartedEvent());
    return BlocBuilder<AuthFlowBloc, AuthFlowState>(
      builder: (context, state) {
        if (state is AuthFlowInitial) {
          return CircularProgressIndicator();
        } else {
          GoRouter routeUsed;
          if (state is AuthFlowSuccess) {
            routeUsed = routes2;
          } else {
            routeUsed = routes;
          }
          return MaterialApp.router(
            title: 'ToDo App',
            themeMode: ThemeMode.system,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            darkTheme: ThemeData.from(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepOrange,
              ),
            ),
            routerConfig: routeUsed,
          );
        }
      },
    );
  }
}
