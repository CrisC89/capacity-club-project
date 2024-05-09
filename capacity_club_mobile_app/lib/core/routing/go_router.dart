import 'package:capacity_club_mobile_app/authenticated/test-login.screen.dart';
import 'package:capacity_club_mobile_app/authenticated/test-register.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/core/public_layout.dart';
import 'package:capacity_club_mobile_app/core/routing/go_router_observer.dart';
import 'package:capacity_club_mobile_app/core/routing/navigator_key.dart';
import 'package:capacity_club_mobile_app/domain-features/authenticated_layout.dart';
import 'package:capacity_club_mobile_app/domain-features/test-auth.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/login',
  observers: [GoRouterObserver()],
  routes: [
    ShellRoute(
      navigatorKey: publicNavigatorKey, // Clé pour la navigation publique
      builder: (context, state, child) =>
          PublicLayout(child: child), // Layout public
      routes: [
        GoRoute(
          name: '/login',
          path: '/login',
          builder: (context, state) => Login(),
          redirect: (context, state) =>
              Redirection.checkAuth(context, state, needsAuth: false),
        ),
        GoRoute(
          name: '/signup',
          path: '/signup',
          builder: (context, state) => Register(),
          redirect: (context, state) =>
              Redirection.checkAuth(context, state, needsAuth: false),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey:
          authenticatedNavigatorKey, // Clé pour la navigation authentifiée
      builder: (context, state, child) => AuthenticatedLayout(child: child),
      routes: [
        GoRoute(
          name: '/dashbord',
          path: '/dashboard',
          builder: (context, state) => Auth(),
          redirect: (context, state) =>
              Redirection.checkAuth(context, state, needsAuth: true),
        ),
        // Autres routes nécessitant une authentification ici...
      ],
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
