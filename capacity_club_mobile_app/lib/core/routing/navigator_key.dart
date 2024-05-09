import 'package:capacity_club_mobile_app/auth/test-login.screen.dart';
import 'package:capacity_club_mobile_app/auth/test-register.dart';
import 'package:capacity_club_mobile_app/domain-features/test-auth.screen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> publicNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'public');
final GlobalKey<NavigatorState> authenticatedNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'authenticated');

final Navigator publicNavigator = Navigator(
  initialRoute: '/login',
  key: publicNavigatorKey,
  onGenerateRoute: (settings) {
    switch (settings.name) {
      case 'signup':
        return MaterialPageRoute(builder: (context) => Register());
        break;
      case 'login':
        return MaterialPageRoute(builder: (context) => Login());
        break;
      default:
        // Il est utile de retourner une page d'erreur ou de fallback ici.
        return MaterialPageRoute(builder: (context) => const Placeholder());
        break;
    }
  },
);

final Navigator authenticatedNavigator = Navigator(
  key: authenticatedNavigatorKey,
  onGenerateRoute: (settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute(builder: (context) => Auth());
      default:
        // Il est utile de retourner une page d'erreur ou de fallback ici.
        return MaterialPageRoute(builder: (context) => const Placeholder());
    }
  },
);
