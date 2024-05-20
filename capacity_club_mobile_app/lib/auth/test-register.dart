import 'package:capacity_club_mobile_app/common/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/common/routing/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Container(
        child: Center(
      child: Column(
        children: [
          Text('Register Page'),
          ElevatedButton(
            onPressed: () {
              authProvider.login(context);
            },
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              // Naviguer vers la page d'inscription
              GoRouter.of(context).go('/login');
            },
            child: Text('Login Page'),
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
