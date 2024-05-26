import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

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
      appBar: AppBar(title: const Text('coucou')),
      body: SafeArea(
        child: AdaptiveLayout(
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('bottom-navigation-small'),
                builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                  destinations: destinations,
                  currentIndex: widget.index,
                  onDestinationSelected: (_) => {},
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
