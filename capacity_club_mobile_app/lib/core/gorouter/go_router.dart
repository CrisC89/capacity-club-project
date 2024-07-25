import 'package:capacity_club_mobile_app/auth/application/pages/login/login_page.dart';
import 'package:capacity_club_mobile_app/auth/application/pages/register/register_page.dart';
import 'package:capacity_club_mobile_app/auth/shared/layout/public_layout.dart';
import 'package:capacity_club_mobile_app/core/gorouter/go_router_observer.dart';
import 'package:capacity_club_mobile_app/core/gorouter/navigator_key.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/home_page.dart';
import 'package:capacity_club_mobile_app/domain-features/core/navigation/authenticated_layout.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/home_training_page.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/setting_page.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/user_profile_page.dart';
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
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          name: '/register',
          path: '/register',
          builder: (context, state) => const RegisterPage(),
        )
      ],
    )
  ],
);

final GoRouter privateRouter = GoRouter(
  initialLocation: '/dashboard',
  observers: [GoRouterObserver()],
  routes: [
    ShellRoute(
      navigatorKey: authenticatedNavigatorKey,
      builder: (context, state, child) => AuthenticatedLayout(),
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/training',
          builder: (context, state) => HomeTrainingPage(),
        ),
        GoRoute(
          path: '/user',
          builder: (context, state) => UserProfilePage(),
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => SettingPage(),
        ),
      ],
    ),
  ],
);
