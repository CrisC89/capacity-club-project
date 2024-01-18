import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  late FlutterSecureStorage _storage;

  factory StorageService() => _instance;

  StorageService._internal() {
    _storage = const FlutterSecureStorage();
  }

  // Write value
  write(String key, String value) async =>
      await _storage.write(key: key, value: value);

  //Read a specific value
  Future<String?> read(String key) async => await _storage.read(key: key);

  // Read all values
  Future<Map<String, String>> allValues() async => await _storage.readAll();

  // Delete a specific value
  delete(String key) async => await _storage.delete(key: key);

  // Delete all
  deleteAll() async => await _storage.deleteAll();

  /*
// saveToken
  saveToken(String token) async {
    CredentialAndToken userData = CredentialAndToken.fromJson(
        jsonDecode((await _storage.read(key: USER_KEY))!));
    _storage.write(
        key: USER_KEY,
        value: jsonEncode(CredentialAndToken(
            token: token,
            refreshToken: userData.refreshToken,
            credential: userData.credential)));
  }*/
}
