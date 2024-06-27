import 'dart:convert';

import 'package:capacity_club_mobile_app/auth/application/pages/auth-flow/bloc/auth_flow_bloc.dart';
import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/common/config/constant.dart';
import 'package:capacity_club_mobile_app/common/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TokenProvider extends ChangeNotifier {
  final LocalStorage _storageService = LocalStorage();
  bool _isLoggedIn = false;
  String? _token;
  String? _refreshToken;

  static final TokenProvider _instance = TokenProvider._internal();

  TokenProvider._internal();

  factory TokenProvider() {
    return _instance;
  }

  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;
  String? get refreshToken => _refreshToken;

  void connectSession(BuildContext context, String token, String refreshToken) {
    _token = token;
    _refreshToken = refreshToken;
    _isLoggedIn = true;
    notifyListeners();
    BlocProvider.of<AuthFlowBloc>(context).add(AuthFlowStartedEvent());
  }

  void disconnectSession(BuildContext context) {
    _token = null;
    _refreshToken = null;
    _isLoggedIn = false;
    notifyListeners();
    BlocProvider.of<AuthFlowBloc>(context).add(AuthFlowStartedEvent());
  }

  Future<void> _retrieveTokens() async {
    try {
      String? userData = await _storageService.read(USER_KEY);
      if (userData != null) {
        CredentialAndTokenModel data =
            CredentialAndTokenModel.fromJson(jsonDecode(userData));
        _token = data.token;
        _refreshToken = data.refreshToken;
        _isLoggedIn = true;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> initialize(BuildContext context) async {
    await _retrieveTokens();
    if (context.mounted) {
      BlocProvider.of<AuthFlowBloc>(context).add(AuthFlowStartedEvent());
    }
  }
}
