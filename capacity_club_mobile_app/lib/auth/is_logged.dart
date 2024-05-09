class AuthService {
  static final AuthService _instance = AuthService._internal();

  static AuthService get instance => _instance;

  bool _authenticated = true; // L'état initial de l'authentification

  AuthService._internal();

  static bool get authenticated => instance._authenticated;

  void login() {
    instance._authenticated = true;
  }

  void logout() {
    instance._authenticated = false;
  }
}
