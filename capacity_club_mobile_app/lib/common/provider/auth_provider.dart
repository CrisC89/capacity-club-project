import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/common/routing/go_router.dart';
import 'package:capacity_club_mobile_app/common/routing/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = true;
  CredentialAndTokenModel? _user;
  AuthFlowBloc? _authFlowBloc;
  BuildContext? _context;

  // Instance unique de AuthProvider
  static final AuthProvider _instance = AuthProvider._internal();

  // Constructeur privé pour empêcher l'instanciation en dehors de cette classe
  AuthProvider._internal();

  // Méthode statique pour récupérer l'instance unique de AuthProvider
  factory AuthProvider() {
    return _instance;
  }

  bool get isLoggedIn => _isLoggedIn;
  CredentialAndTokenModel? get user => _user;

  void initialize(BuildContext context) {
    if (_context == null) {
      _context = context;
      _authFlowBloc = BlocProvider.of<AuthFlowBloc>(_context!);
    }
  }

  void setUser(CredentialAndTokenModel user) {
    _user = user;
    _isLoggedIn = true;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowStartedEvent());
    }
  }

  void clearUser() {
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowStartedEvent());
    }
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowStartedEvent());
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowStartedEvent());
    }
  }
}
