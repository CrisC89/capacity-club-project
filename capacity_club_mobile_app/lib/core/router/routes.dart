import 'package:capacity_club_mobile_app/core/router/go_router_observer.dart';
import 'package:capacity_club_mobile_app/features/dashboard/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      path: '/home/settings',
      builder: (context, state) {
        return Container(
          color: Colors.amber,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => context.push('/home/start'),
                child: const Text('Go to start'),
              ),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.push('/home/start');
                  }
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        );
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        return const DashboardContainer();
      },
    )
  ],
);
