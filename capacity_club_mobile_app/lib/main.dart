import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/auth_flow_page.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/login/bloc/login_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/register/bloc/register_bloc.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/core/provider/theme_provider.dart';
import 'package:capacity_club_mobile_app/core/utils/dependency_injection.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/bloc/test_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/core/navigation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/utils/dependency_injection.dart' as dependencyInjection;

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loading Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingLogoPage(),
    );
  }
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection.init();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
          BlocProvider<AuthFlowBloc>(
              create: (_) => serviceLocator<AuthFlowBloc>()),
          BlocProvider<LoginBloc>(create: (_) => serviceLocator<LoginBloc>()),
          BlocProvider<RegisterBloc>(
              create: (_) => serviceLocator<RegisterBloc>()),
          //Test Bloc
          BlocProvider<TestBloc>(create: (_) => TestBloc())
        ],
        child: Builder(builder: (context) {
          AuthProvider authProvider =
              Provider.of<AuthProvider>(context, listen: false);
          authProvider.initialize(context);
          return const AuthFlowPage();
        })),
  );
}
