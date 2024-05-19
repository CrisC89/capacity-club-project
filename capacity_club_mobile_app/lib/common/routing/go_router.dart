import 'package:capacity_club_mobile_app/auth/test-login.screen.dart';
import 'package:capacity_club_mobile_app/auth/test-register.dart';
import 'package:capacity_club_mobile_app/auth/public_layout.dart';
import 'package:capacity_club_mobile_app/common/routing/go_router_observer.dart';
import 'package:capacity_club_mobile_app/common/routing/navigator_key.dart';
import 'package:capacity_club_mobile_app/domain-features/common/authenticated_layout.dart';
import 'package:capacity_club_mobile_app/domain-features/test-auth.screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter publicRouter = GoRouter(
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
        ),
        GoRoute(
            name: '/signup',
            path: '/signup',
            builder: (context, state) => Register()),
      ],
    )
  ],
);

final GoRouter privateRouter = GoRouter(
  initialLocation: '/dashboard',
  observers: [GoRouterObserver()],
  routes: [
    ShellRoute(
      navigatorKey:
          authenticatedNavigatorKey, // Clé pour la navigation authentifiée
      builder: (context, state, child) => AuthenticatedLayout(child: child),
      routes: [
        GoRoute(
            name: '/dashboard',
            path: '/dashboard',
            builder: (context, state) => Auth()),
        // Autres routes nécessitant une authentification ici...
      ],
    ),
  ],
);
