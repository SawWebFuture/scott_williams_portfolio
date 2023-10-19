import 'dart:async';

abstract class IKeyValueStorage {
  Future<void> setString(String key, String value);

  FutureOr<String> getString(String key);

  Future<void> setBool(String key, bool value);

  FutureOr<bool> getBool(String key);

  Future<void> setInt(String key, int value);

  int getInt(String key);

  Future<void> removeKey(String key);
}
