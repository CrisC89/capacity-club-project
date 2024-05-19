import 'package:capacity_club_mobile_app/auth/is_logged.dart';
import 'package:capacity_club_mobile_app/common/provider/auth_provider.dart';
import 'package:capacity_club_mobile_app/common/routing/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Container(
        child: Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              authProvider.logout(context);
            },
            child: Text('Logout'),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/signup');
            },
            child: Text('Register'),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/login');
            },
            child: Text('Go to Login Page'),
          ),
        ],
      ),
    ));
  }
}
