import 'package:flutter/material.dart';

class PublicLayout extends StatelessWidget {
  final Widget child;

  const PublicLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
