import 'package:capacity_club_mobile_app/common/provider/theme_provider.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/navigation/bloc/navigation_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/page/home/home_page.dart';
import 'package:capacity_club_mobile_app/domain-features/personal-training/application/pages/personal-training-page/personal_training_page.dart';
import 'package:capacity_club_mobile_app/domain-features/setting/application/pages/setting-page/setting_page.dart';
import 'package:capacity_club_mobile_app/domain-features/user-profile/application/pages/user-profile/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AuthenticatedLayout extends StatefulWidget {
  const AuthenticatedLayout({super.key});

  @override
  State<AuthenticatedLayout> createState() => _AuthenticatedLayoutState();
}

class _AuthenticatedLayoutState extends State<AuthenticatedLayout> {
  List<NavigationDestination> destinations = [
    const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    const NavigationDestination(icon: Icon(Icons.work), label: 'Training'),
    const NavigationDestination(
        icon: Icon(Icons.verified_user_rounded), label: 'User'),
    const NavigationDestination(icon: Icon(Icons.settings), label: 'Setting')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Auth Layout'),
          centerTitle: true,
          actions: [
            Switch(
                value: Provider.of<ThemeProvider>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body: SafeArea(
          child: AdaptiveLayout(
            primaryNavigation: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('primary-navigation-medium'),
                  builder: (context) => AdaptiveScaffold.standardNavigationRail(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    selectedIconTheme: IconThemeData(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    unselectedIconTheme: IconThemeData(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    selectedLabelTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    unSelectedLabelTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    destinations: destinations
                        .map(
                          (element) =>
                              AdaptiveScaffold.toRailDestination(element),
                        )
                        .toList(),
                    selectedIndex: () {
                      final state = context.read<NavigationBloc>().state;
                      if (state is HomeState) return 0;
                      if (state is PersonalTrainingState) return 1;
                      if (state is UserProfileState) return 2;
                      if (state is SettingState) return 3;
                      return 0;
                    }(),
                    onDestinationSelected: (index) {
                      switch (index) {
                        case 0:
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigateToHomePage());
                          break;
                        case 1:
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigateToPersonalTrainingPage());
                          break;
                        case 2:
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigateToUserProfilePage());
                          break;
                        case 3:
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigateToSettingPage());
                          break;
                      }
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
                      int currentIndex = 0;
                      if (state is HomeState) {
                        currentIndex = 0;
                      } else if (state is PersonalTrainingState) {
                        currentIndex = 1;
                      } else if (state is UserProfileState) {
                        currentIndex = 2;
                      } else if (state is SettingState) {
                        currentIndex = 3;
                      }
                      return BottomNavigationBar(
                        items: destinations
                            .map(
                              (element) => BottomNavigationBarItem(
                                icon: element.icon,
                                label: element.label,
                              ),
                            )
                            .toList(),
                        currentIndex: currentIndex,
                        selectedItemColor:
                            Theme.of(context).colorScheme.primary,
                        unselectedItemColor:
                            Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        onTap: (index) {
                          switch (index) {
                            case 0:
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigateToHomePage());
                              break;
                            case 1:
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigateToPersonalTrainingPage());
                              break;
                            case 2:
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigateToUserProfilePage());
                              break;
                            case 3:
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigateToSettingPage());
                              break;
                          }
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
                      if (state is HomeState) {
                        return HomePage();
                      } else if (state is PersonalTrainingState) {
                        return PersonalTrainingPage();
                      } else if (state is UserProfileState) {
                        return UserProfilePage();
                      } else if (state is SettingState) {
                        return SettingPage();
                      }
                      return HomePage(); // Default case
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
}
