import 'dart:convert';

import 'package:capacity_club_mobile_app/auth/data/model/credential_and_token_model.dart';
import 'package:capacity_club_mobile_app/common/utils/config_constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  late FlutterSecureStorage _storage;

  factory LocalStorage() => _instance;

  LocalStorage._internal() {
    _storage = const FlutterSecureStorage();
  }

  write(String key, String value) async =>
      await _storage.write(key: key, value: value);

  Future<String?> read(String key) async => await _storage.read(key: key);

  Future<Map<String, String>> allValues() async => await _storage.readAll();

  delete(String key) async => await _storage.delete(key: key);

  deleteAll() async => await _storage.deleteAll();

  saveToken(String token) async {
    CredentialAndTokenModel userData = CredentialAndTokenModel.fromJson(
        jsonDecode((await _storage.read(key: USER_KEY))!));
    _storage.write(
        key: USER_KEY,
        value: jsonEncode(CredentialAndTokenModel(
            token: token,
            refreshToken: userData.refreshToken,
            credential: userData.credential)));
  }
}
