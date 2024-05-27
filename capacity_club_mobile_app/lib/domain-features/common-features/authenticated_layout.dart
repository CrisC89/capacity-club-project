import 'package:capacity_club_mobile_app/common/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:provider/provider.dart';

class AuthenticatedLayout extends StatefulWidget {
  const AuthenticatedLayout({super.key, required this.child});
  final Widget child;
  final int index = 0;

  static final tabs = [
    const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    const NavigationDestination(icon: Icon(Icons.work), label: 'Training'),
    const NavigationDestination(
        icon: Icon(Icons.verified_user_rounded), label: 'User'),
    const NavigationDestination(
        icon: Icon(Icons.settings_accessibility), label: 'Setting')
  ];

  @override
  State<AuthenticatedLayout> createState() => _AuthenticatedLayoutState();
}

class _AuthenticatedLayoutState extends State<AuthenticatedLayout> {
  List<NavigationDestination> destinations = <NavigationDestination>[
    const NavigationDestination(
      label: 'Inbox',
      icon: Icon(Icons.inbox),
    ),
    const NavigationDestination(
      label: 'Articles',
      icon: Icon(Icons.article_outlined),
    ),
    const NavigationDestination(
      label: 'Chat',
      icon: Icon(Icons.chat_bubble_outline),
    ),
    const NavigationDestination(
      label: 'Video',
      icon: Icon(Icons.video_call_outlined),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Theme.of(context).colorScheme.primary),
                  unselectedIconTheme: IconThemeData(
                      color: Theme.of(context).colorScheme.onBackground),
                  selectedLabelTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  unSelectedLabelTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
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
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('bottom-navigation-small'),
                builder: (context) => BottomNavigationBar(
                  items: destinations
                      .map(
                        (element) => BottomNavigationBarItem(
                          icon: element.icon,
                          label: element.label,
                        ),
                      )
                      .toList(),
                  currentIndex: widget.index,
                  selectedItemColor: Theme.of(context).colorScheme.primary,
                  unselectedItemColor:
                      Theme.of(context).colorScheme.onBackground,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  onTap: (index) {},
                ),
              ),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body-small'),
                builder: (_) => widget.child,
              ),
            },
          ),
        ),
      ),
    );
  }
}
