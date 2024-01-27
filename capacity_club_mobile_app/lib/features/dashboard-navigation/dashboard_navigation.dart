import 'package:capacity_club_mobile_app/features/collective-training-session/presentation/page/collective-training-session/collective_training_session_page.dart';
import 'package:capacity_club_mobile_app/features/core/contract/page_config.dart';
import 'package:capacity_club_mobile_app/features/setting/presentation/page/setting_page.dart';
import 'package:capacity_club_mobile_app/features/user/presentation/page/user/user_page.dart';
import 'package:capacity_club_mobile_app/features/personnal-workout-planning/presentation/page/personnal_workout_planning_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

class DashboardNavigation extends StatefulWidget {
  DashboardNavigation({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) => element.name == tab);

  static const pageConfig = PageConfig(
      icon: Icons.hourglass_empty,
      name: 'dashboard',
      child: CollectiveTrainingSessionPage());
  final int index;

  // list of all tabs that should be displayed inside our navigation bar
  static const tabs = [
    CollectiveTrainingSessionPage.pageConfig,
    PersonnalWorkoutPlanningPage.pageConfig,
    UserPage.pageConfig,
    SettingPage.pageConfig
  ];

  @override
  State<DashboardNavigation> createState() => _DashboardNavigationState();
}

class _DashboardNavigationState extends State<DashboardNavigation> {
  final destinations = DashboardNavigation.tabs
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
                builder: (_) => DashboardNavigation.tabs[widget.index].child,
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
        DashboardNavigation.pageConfig.name,
        pathParameters: {
          'tab': DashboardNavigation.tabs[index].name,
        },
      );
}
