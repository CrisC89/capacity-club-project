import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/core/config/constant.dart';
import 'package:capacity_club_mobile_app/core/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  late CredentialAndTokenModel? _credentialUser;
  AuthFlowBloc? _authFlowBloc;
  BuildContext? _context;
  String? _token;
  String? _refreshToken;
  final LocalStorage _localStorage = LocalStorage();

  // Instance unique de AuthProvider
  static final AuthProvider _instance = AuthProvider._internal();

  AuthProvider._internal();

  factory AuthProvider() {
    return _instance;
  }

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }

  void setCredentialUser(CredentialAndTokenModel credentialUser) {
    _credentialUser = credentialUser;
  }

  bool get isLoggedIn => _isLoggedIn;
  CredentialAndTokenModel? get credentialUser => _credentialUser;

  void setUser(CredentialAndTokenModel user) {
    _credentialUser = user;
    _isLoggedIn = true;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowCheckStateEvent());
    }
  }

  void clearUser() {
    _credentialUser = null;
    _isLoggedIn = false;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowCheckStateEvent());
    }
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowCheckStateEvent());
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
    if (_authFlowBloc != null) {
      _authFlowBloc?.add(AuthFlowCheckStateEvent());
    }
  }

  void initialize(BuildContext context) async {
    if (_context == null) {
      _context = context;
      _authFlowBloc = BlocProvider.of<AuthFlowBloc>(_context!);
    }
  }

  Future<String?> getToken() async {
    return await _localStorage.read(USER_KEY);
  }
}
