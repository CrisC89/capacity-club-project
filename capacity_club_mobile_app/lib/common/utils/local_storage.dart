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
}
