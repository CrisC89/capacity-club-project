import 'package:capacity_club_mobile_app/core/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/core/auth-flow/page/auth_flow_page.dart';
import 'package:capacity_club_mobile_app/core/init.page.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/*void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: const InitPage(),
  ));
}*/

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      BlocProvider<AuthFlowBloc>(
          create: (_) => AuthFlowBloc()), // Fournir votre AuthFlowBloc
    ], child: AuthFlowPage()),
  );
}
