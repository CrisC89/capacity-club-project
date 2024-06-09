import 'package:capacity_club_mobile_app/common/provider/theme_provider.dart';
import 'package:capacity_club_mobile_app/domain-features/common-features/application/navigation/bloc/navigation_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/contact/page/contact_page.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/page/home/home_page.dart';
import 'package:capacity_club_mobile_app/domain-features/home/application/page/home/test-home.page.dart';
import 'package:capacity_club_mobile_app/domain-features/personal-training/application/pages/personal-training-page/personal_training_page.dart';
import 'package:capacity_club_mobile_app/domain-features/setting/application/pages/setting-page/setting_page.dart';
import 'package:capacity_club_mobile_app/domain-features/user-profile/application/pages/user-profile/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AuthenticatedLayout extends StatefulWidget {
  const AuthenticatedLayout({super.key});

  @override
  State<AuthenticatedLayout> createState() => _AuthenticatedLayoutState();
}

class _AuthenticatedLayoutState extends State<AuthenticatedLayout> {
  List<NavigationDestination> destinations = [
    const NavigationDestination(
        icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
    const NavigationDestination(
        icon: FaIcon(FontAwesomeIcons.dumbbell), label: 'Training'),
    const NavigationDestination(
        icon: FaIcon(FontAwesomeIcons.user), label: 'User'),
    const NavigationDestination(
        icon: FaIcon(FontAwesomeIcons.cog), label: 'Setting')
  ];

  _onNavigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        BlocProvider.of<NavigationBloc>(context).add(NavigateToHomePage());
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
        BlocProvider.of<NavigationBloc>(context).add(NavigateToSettingPage());
        break;
    }
  }

  int _onSelectedIndex(BuildContext context) {
    final state = context.read<NavigationBloc>().state;

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('CAPACITY CLUB'), centerTitle: true),
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
                    selectedIndex: _onSelectedIndex(context),
                    onDestinationSelected: (index) {
                      _onNavigate(context, index);
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
                            .map(
                              (element) => BottomNavigationBarItem(
                                icon: element.icon,
                                label: element.label,
                              ),
                            )
                            .toList(),
                        currentIndex: _onSelectedIndex(context),
                        selectedItemColor:
                            Theme.of(context).colorScheme.primary,
                        unselectedItemColor:
                            Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        onTap: (index) {
                          _onNavigate(context, index);
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
                        return ContactPage();
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
