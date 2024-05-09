import 'package:capacity_club_mobile_app/auth/is_logged.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/core/routing/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login Page'),
          ElevatedButton(
            onPressed: () {
              authProvider.login();
            },
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/signup');
            },
            child: Text('Register'),
          ),
          ElevatedButton(
            onPressed: () {
              // Naviguer directement vers le tableau de bord (à utiliser avec prudence)
              GoRouter.of(context).go('/dashboard');
            },
            child: Text('Go to Dashboard'),
          ),
        ],
      ),
    ));
  }
}
