import 'package:capacity_club_mobile_app/authenticated/is_logged.dart';
import 'package:capacity_club_mobile_app/authenticated/test-login.screen.dart';
import 'package:capacity_club_mobile_app/authenticated/test-register.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/domain-features/test-auth.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter routes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => Login(),
      redirect: (context, state) =>
          Redirection.checkAuth(context, state, needsAuth: false),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => Register(),
      redirect: (context, state) =>
          Redirection.checkAuth(context, state, needsAuth: false),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => Auth(),
      redirect: (context, state) =>
          Redirection.checkAuth(context, state, needsAuth: true),
    ),
  ],
);

class Redirection {
  static String? checkAuth(BuildContext context, GoRouterState state,
      {required bool needsAuth}) {
    final isLoggedIn =
        Provider.of<AuthProvider>(context, listen: false).isLoggedIn;

    if (needsAuth && !isLoggedIn) {
      return '/login';
    } else if (!needsAuth && isLoggedIn) {
      return '/dashboard';
    }
    return null;
  }
}
