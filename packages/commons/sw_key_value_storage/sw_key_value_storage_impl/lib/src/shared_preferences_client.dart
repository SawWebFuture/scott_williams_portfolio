import 'dart:async';

import 'package:sw_dependencies/sw_dependencies.dart';

class SharedPreferencesClient implements IKeyValueStorage {
  final SharedPreferences sharedPreferences;

  SharedPreferencesClient(this.sharedPreferences);

  @override
  Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  FutureOr<String> getString(String key) {
    return sharedPreferences.getString(key) ?? '';
  }

  @override
  Future<void> removeKey(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  FutureOr<bool> getBool(String key) async {
    return sharedPreferences.getBool(key) ?? false;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  int getInt(String key) {
    return sharedPreferences.getInt(key) ?? 0;
  }

  @override
  Future<void> setInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }
}
