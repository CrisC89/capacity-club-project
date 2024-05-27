import 'package:capacity_club_mobile_app/common/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/common/provider/theme_provider.dart';
import 'package:capacity_club_mobile_app/common/routing/go_router.dart';
import 'package:capacity_club_mobile_app/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthFlowInitView extends StatelessWidget {
  final GoRouter router;
  const AuthFlowInitView({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      title: 'Capacity Club',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
