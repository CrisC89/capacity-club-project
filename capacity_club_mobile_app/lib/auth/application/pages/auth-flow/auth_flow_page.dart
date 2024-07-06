import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/view_states/auth_flow_init_view.dart';
import 'package:capacity_club_mobile_app/auth/application/core/view/auth_flow_loading_view.dart';
import 'package:capacity_club_mobile_app/common/i18n/app_local.dart';
import 'package:capacity_club_mobile_app/common/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/common/routing/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthFlowPage extends StatefulWidget {
  const AuthFlowPage({super.key});

  @override
  State<AuthFlowPage> createState() => _AuthFlowPageState();
}

class _AuthFlowPageState extends State<AuthFlowPage> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          AppLocale.enTranslation,
          countryCode: 'US',
        ),
        const MapLocale(
          'fr',
          AppLocale.frTranslation,
          countryCode: 'FR',
        ),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  Future<void> _initializeAuth() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.initialize(context);
    BlocProvider.of<AuthFlowBloc>(context).add(AuthFlowCheckUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    _initializeAuth();
    return BlocBuilder<AuthFlowBloc, AuthFlowState>(
      builder: (context, state) {
        if (state is AuthFlowInitial) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: AuthLoadingView());
        } else {
          GoRouter router;
          if (state is AuthFlowSuccess) {
            router = privateRouter;
          } else {
            router = publicRouter;
          }
          return AuthFlowInitView(router: router, localization: _localization);
        }
      },
    );
  }
}
