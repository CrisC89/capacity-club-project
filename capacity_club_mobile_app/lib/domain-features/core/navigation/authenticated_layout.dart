import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/test_page.dart';
import 'package:capacity_club_mobile_app/domain-features/core/navigation/bloc/navigation_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/setting_page.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/home_page.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/home_training_page.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/user-profile/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthenticatedLayout extends StatefulWidget {
  const AuthenticatedLayout({super.key});

  static const tab = [
    HomePage.pageConfig,
    HomeTrainingPage.pageConfig,
    UserProfilePage.pageConfig,
    SettingPage.pageConfig,
    TestPage.pageConfig
  ];

  @override
  State<AuthenticatedLayout> createState() => _AuthenticatedLayoutState();
}

class _AuthenticatedLayoutState extends State<AuthenticatedLayout> {
  int index = 0;
  final destinations = AuthenticatedLayout.tab.map((page) =>
      NavigationDestination(icon: FaIcon(page.icon), label: page.name));

  void setIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AuthenticatedLayout.tab[index].name.toUpperCase(),
          style: AppTheme.mediumTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            setState(() {
              index = _getSelectedIndexFromState(state);
            });
          },
          child: AdaptiveLayout(
            primaryNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('primary-navigation-medium'),
                  builder: (context) => AdaptiveScaffold.standardNavigationRail(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    selectedIconTheme: IconThemeData(
                      color: Color.fromARGB(255, 4, 136, 183),
                    ),
                    unselectedIconTheme: IconThemeData(
                      color: Color(0xff949494),
                    ),
                    selectedLabelTextStyle: TextStyle(
                      color: Color.fromARGB(255, 4, 136, 183),
                    ),
                    unSelectedLabelTextStyle: TextStyle(
                      color: Color(0xff949494),
                    ),
                    destinations: destinations
                        .map((element) =>
                            AdaptiveScaffold.toRailDestination(element))
                        .toList(),
                    selectedIndex: index,
                    onDestinationSelected: (newIndex) {
                      _onNavigate(context, newIndex);
                    },
                  ),
                ),
              },
            ),
            bottomNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.small: SlotLayout.from(
                  key: const Key('bottom-navigation-small'),
                  builder: (context) =>
                      BlocBuilder<NavigationBloc, NavigationState>(
                    builder: (context, state) {
                      return BottomNavigationBar(
                        items: destinations
                            .map((element) => BottomNavigationBarItem(
                                  icon: element.icon,
                                  label: element.label,
                                ))
                            .toList(),
                        currentIndex: index,
                        selectedItemColor: Color.fromARGB(255, 4, 136, 183),
                        unselectedItemColor: Color(0xff949494),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        onTap: (newIndex) {
                          _onNavigate(context, newIndex);
                        },
                      );
                    },
                  ),
                ),
              },
            ),
            body: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key('primary-body-small'),
                  builder: (context) =>
                      BlocBuilder<NavigationBloc, NavigationState>(
                    builder: (context, state) {
                      return _getPageFromState(state);
                    },
                  ),
                ),
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPageFromState(NavigationState state) {
    if (state is HomeState) {
      return HomePage.pageConfig.child;
    } else if (state is PersonalTrainingState) {
      return HomeTrainingPage.pageConfig.child;
    } else if (state is UserProfileState) {
      return TestPage.pageConfig.child;
    } else if (state is SettingState) {
      return SettingPage.pageConfig.child;
    } else {
      return HomePage(); // Default case
    }
  }

  int _getSelectedIndexFromState(NavigationState state) {
    if (state is HomeState) {
      return 0;
    } else if (state is PersonalTrainingState) {
      return 1;
    } else if (state is UserProfileState) {
      return 2;
    } else if (state is SettingState) {
      return 3;
    } else {
      return 0;
    }
  }

  void _onNavigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.read<NavigationBloc>().add(NavigateToHomePage());
        break;
      case 1:
        context.read<NavigationBloc>().add(NavigateToPersonalTrainingPage());
        break;
      case 2:
        context.read<NavigationBloc>().add(NavigateToUserProfilePage());
        break;
      case 3:
        context.read<NavigationBloc>().add(NavigateToSettingPage());
        break;
    }
  }
}
