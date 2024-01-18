import 'package:capacity_club_mobile_app/config/routes/go_router_observer.dart';
import 'package:capacity_club_mobile_app/features/dashboard/dashboard_container.dart';
import 'package:capacity_club_mobile_app/features/home/presentation/page/home_page.dart';
import 'package:capacity_club_mobile_app/features/setting/presentation/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const String _basePath = '/dashboard';

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '$_basePath/${HomePage.pageConfig.name}',
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      name: SettingPage.pageConfig.name,
      path: '$_basePath/settings',
      builder: (context, state) {
        return const SettingPage();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          name: DashboardContainer.pageConfig.name,
          path: '$_basePath/:tab',
          builder: (context, state) => DashboardContainer(
            key: state.pageKey,
            tab: state.pathParameters['tab'] ?? 'home',
          ),
        ),
      ],
    ),
  ],
);
