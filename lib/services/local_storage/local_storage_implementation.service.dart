import 'package:empregonaarea/services/local_storage/local_storage.service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageServiceImp implements LocalStorageService {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Future<String> getDataAsJson(String key) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

    try {
      String? value = await storage.read(key: key);
      return value ?? "";
    } catch (e) {
      return "";
    }
  }

  @override
  Future<String> saveDataAsJson(String key, String json) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

    try {
      await storage.write(key: key, value: json);
      return json;
    } catch (e) {
      return "";
    }
  }

  @override
  Future<bool> deleteData(String key) async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

    try {
      await storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> updateDataAsJson(String key, String json) async {
    try {
      await deleteData(key);
      await saveDataAsJson(key, json);
      return json;
    } catch (e) {
      return "";
    }
  }

  @override
  Future<bool> deleteAll() async {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

    try {
      await storage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}
