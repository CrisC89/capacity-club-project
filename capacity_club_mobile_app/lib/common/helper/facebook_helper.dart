import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookHelper {
  String email = '';
  String id = '';

  static Future<String?> signIn() async {
    final result = await FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]);
    if (result.status == LoginStatus.success) {
      final Map<String, dynamic> credential =
          await FacebookAuth.instance.getUserData();
      if (credential != null) {
        String email = '';
        String id = '';
        for (MapEntry<String, dynamic> item in credential.entries) {
          if (item.key == 'email') {
            email = item.value;
          } else if (item.key == 'id') {
            id = item.value;
          }
        }
        return email + id;
      }
    }
    return null;
  }

  static Future<Map<String, dynamic>?> signUp() async {
    try {
      print('Try');
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);
      if (result.status == LoginStatus.success) {
        final Map<String, dynamic> credential =
            await FacebookAuth.instance.getUserData();
        return credential;
      }
      return null;
    } on Exception catch (e) {
      print('Catch');
      print(e);
      return Future(() => null);
    }
  }
}
