import 'package:capacity_club_mobile_app/core/routing/go_router.dart';
import 'package:capacity_club_mobile_app/core/routing/navigator_key.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
    routes.replace('/dashboard');
    authenticatedNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil('/dashboard', (route) => false);
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
    routes.replace('/login');
  }
}
