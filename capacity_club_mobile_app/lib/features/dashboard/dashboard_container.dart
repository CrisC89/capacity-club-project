import 'package:capacity_club_mobile_app/features/home/application/page/home_page.dart';
import 'package:capacity_club_mobile_app/features/planning/application/page/planning_page.dart';
import 'package:capacity_club_mobile_app/features/setting/application/page/setting_page.dart';
import 'package:capacity_club_mobile_app/features/user/application/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({super.key});

  static const tabs = [
    HomePage.pageConfig,
    PlanningPage.pageConfig,
    UserPage.pageConfig,
    SettingPage.pageConfig
  ];

  @override
  Widget build(BuildContext context) {
    final destinations = DashboardContainer.tabs
        .map(
          (page) => NavigationDestination(
            icon: Icon(page.icon),
            label: page.name,
          ),
        )
        .toList();

    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-navigation-medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                  destinations: destinations
                      .map(
                        (element) =>
                            AdaptiveScaffold.toRailDestination(element),
                      )
                      .toList(),
                ),
              ),
            },
          ),
          bottomNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
                key: const Key('bottom-navigation-small'),
                builder: (context) =>
                    AdaptiveScaffold.standardBottomNavigationBar(
                      destinations: destinations,
                    ))
          }),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body'),
                builder: (context) => const Placeholder(),
              )
            },
          ),
          secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('secondary-body'),
              builder: (context) => const Placeholder(),
            )
          }),
        ),
      ),
    );
  }
}
