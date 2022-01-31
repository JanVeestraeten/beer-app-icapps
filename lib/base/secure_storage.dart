import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore_for_file: non_constant_identifier_names
class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static final ACCESS_TOKEN = "access_token";
  static final REFRESH_TOKEN = "refresh_token";

  static Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  static Future<String?> readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  static Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  static Future deleteAll() async {
    await _storage.deleteAll();
  }
}
