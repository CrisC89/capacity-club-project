import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/view_states/auth_flow_init_view.dart';
import 'package:capacity_club_mobile_app/auth/application/core/view/auth_flow_loading_view.dart';
import 'package:capacity_club_mobile_app/common/routing/go_router.dart';
import 'package:capacity_club_mobile_app/common/utils/dependency_injection.dart';
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
          return const MaterialApp(home: AuthLoadingView());
        } else {
          GoRouter router;
          if (state is AuthFlowSuccess) {
            router = privateRouter;
          } else {
            router = publicRouter;
          }
          return AuthFlowInitView(router: router);
        }
      },
    );
  }
}
