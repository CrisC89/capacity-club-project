import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:capacity_club_mobile_app/core/config/constant.dart';

class GoogleHelper {
  static final _googleSignIn =
      Platform.isIOS ? GoogleSignIn(clientId: clientID()) : GoogleSignIn();

  static Future<GoogleSignInAccount?> signIn() {
    print('Method signIn API Google');
    try {
      print('Try');
      var retVal = _googleSignIn.signIn();
      print("Valeur de retour $retVal");
      return retVal;
    } on Exception catch (e) {
      print('Catch');
      print(e);
      return Future(() => null);
    }
  }
}
