import 'package:capacity_club_mobile_app/features/core/model/page_config.dart';
import 'package:capacity_club_mobile_app/features/home/presentation/page/home_page.dart';
import 'package:capacity_club_mobile_app/features/setting/presentation/page/setting_page.dart';
import 'package:capacity_club_mobile_app/features/user/presentation/page/user/user_page.dart';
import 'package:capacity_club_mobile_app/features/workout-planning/presentation/page/planning_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

class DashboardContainer extends StatefulWidget {
  DashboardContainer({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) => element.name == tab);

  static const pageConfig = PageConfig(
      icon: Icons.hourglass_empty, name: 'dashboard', child: HomePage());
  final int index;

  // list of all tabs that should be displayed inside our navigation bar
  static const tabs = [
    HomePage.pageConfig,
    WorkoutPlanningPage.pageConfig,
    UserPage.pageConfig,
    SettingPage.pageConfig
  ];

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  final destinations = DashboardContainer.tabs
      .map(
        (page) =>
            NavigationDestination(icon: Icon(page.icon), label: page.name),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-navigation-medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                  selectedLabelTextStyle:
                      TextStyle(color: theme.colorScheme.onBackground),
                  selectedIconTheme:
                      IconThemeData(color: theme.colorScheme.onBackground),
                  unselectedIconTheme: IconThemeData(
                      color: theme.colorScheme.onBackground.withOpacity(0.5)),
                  onDestinationSelected: (index) =>
                      _tapOnNavigationDestination(context, index),
                  selectedIndex: widget.index,
                  destinations: destinations
                      .map(
                        (_) => AdaptiveScaffold.toRailDestination(_),
                      )
                      .toList(),
                ),
              ),
            },
          ),
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('bottom-navigation-small'),
                builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                  destinations: destinations,
                  currentIndex: widget.index,
                  onDestinationSelected: (value) =>
                      _tapOnNavigationDestination(context, value),
                ),
              ),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body-small'),
                builder: (_) => DashboardContainer.tabs[widget.index].child,
              ),
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary-body-medium'),
                builder: AdaptiveScaffold.emptyBuilder,
              ),
            },
          ),
        ),
      ),
    );
  }

  void _tapOnNavigationDestination(BuildContext context, int index) =>
      context.goNamed(
        DashboardContainer.pageConfig.name,
        pathParameters: {
          'tab': DashboardContainer.tabs[index].name,
        },
      );
}
