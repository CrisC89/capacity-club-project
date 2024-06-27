import 'package:capacity_club_mobile_app/auth/application/pages/login/login_page.dart';
import 'package:capacity_club_mobile_app/auth/shared/layout/public_layout.dart';
import 'package:capacity_club_mobile_app/common/routing/go_router_observer.dart';
import 'package:capacity_club_mobile_app/common/config/navigator_key.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/page/home/home_page.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/authenticated_layout.dart';
import 'package:capacity_club_mobile_app/domain-features/personal-training/application/pages/personal-training-page/personal_training_page.dart';
import 'package:capacity_club_mobile_app/domain-features/setting/application/pages/setting-page/setting_page.dart';
import 'package:capacity_club_mobile_app/domain-features/test-auth.screen.dart';
import 'package:capacity_club_mobile_app/domain-features/user-profile/application/pages/user-profile/user_profile_page.dart';
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
          builder: (context, state) => LoginPage(),
        )
      ],
    )
  ],
);

final GoRouter privateRouter = GoRouter(
  initialLocation: '/dashboard',
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
          builder: (context, state) => PersonalTrainingPage(),
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
