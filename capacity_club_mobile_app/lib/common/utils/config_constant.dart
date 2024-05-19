import 'dart:io';

const BASE_URL = 'http://192.168.1.12:2023/api/';
const USER_KEY = 'cc_user';
const REFRESH_TOKEN_KEY = 'cc_refresh_token';
const BACKEND_TOKEN_KEY = 'cc_backend_token';
const GOOGLE_ISSUER = 'https://accounts.google.com';
const GOOGLE_CLIENT_ID_IOS =
    '489749231402-rct46vemmf83o4lok1t0e5td6i5i85lh.apps.googleusercontent.com';
const GOOGLE_REDIRECT_URI_IOS =
    'com.googleusercontent.apps.489749231402-rct46vemmf83o4lok1t0e5td6i5i85lh:/oauthredirect';
const GOOGLE_CLIENT_ID_ANDROID =
    '489749231402-ao252sppjm9tg9o6ticdeus3o10cq815.apps.googleusercontent.com';
const GOOGLE_REDIRECT_URI_ANDROID =
    'com.googleusercontent.apps.489749231402-ao252sppjm9tg9o6ticdeus3o10cq815:/oauthredirect';

String clientID() {
  if (Platform.isAndroid) {
    return GOOGLE_CLIENT_ID_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_CLIENT_ID_IOS;
  }
  return '';
}

String redirectUrl() {
  if (Platform.isAndroid) {
    return GOOGLE_REDIRECT_URI_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_REDIRECT_URI_IOS;
  }
  return '';
}
