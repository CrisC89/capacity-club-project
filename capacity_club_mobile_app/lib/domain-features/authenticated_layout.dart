import 'package:flutter/material.dart';

class AuthenticatedLayout extends StatelessWidget {
  final Widget child;

  const AuthenticatedLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connecter'),
      ),
      body: child,
    );
  }
}
