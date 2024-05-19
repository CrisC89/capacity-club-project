import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/common/routing/go_router.dart';
import 'package:capacity_club_mobile_app/common/routing/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  // Instance unique de AuthProvider
  static final AuthProvider _instance = AuthProvider._internal();

  // Constructeur privé pour empêcher l'instanciation en dehors de cette classe
  AuthProvider._internal();

  // Méthode statique pour récupérer l'instance unique de AuthProvider
  factory AuthProvider() {
    return _instance;
  }

  bool get isLoggedIn => _isLoggedIn;

  void login(BuildContext context) {
    _isLoggedIn = true;
    notifyListeners();
    BlocProvider.of<AuthFlowBloc>(context).add(AuthFlowStartedEvent());
  }

  void logout(BuildContext context) {
    _isLoggedIn = false;
    notifyListeners();
    BlocProvider.of<AuthFlowBloc>(context).add(AuthFlowStartedEvent());
  }
}
