import 'package:capacity_club_mobile_app/authenticated/is_logged.dart';
import 'package:capacity_club_mobile_app/core/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Container(
        child: Center(
      child: Column(
        children: [
          Text('Register Page'),
          ElevatedButton(
            onPressed: () {
              authProvider.login();
            },
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              // Naviguer vers la page d'inscription
              context.push('/login');
            },
            child: Text('Login Page'),
          ),
          ElevatedButton(
            onPressed: () {
              // Naviguer directement vers le tableau de bord (à utiliser avec prudence)
              context.go('/dashboard');
            },
            child: Text('Go to Dashboard'),
          ),
        ],
      ),
    ));
  }
}
