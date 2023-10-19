import 'package:flutter/material.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier({required IKeyValueStorage storage})
      : _storage = storage,
        super(ThemeMode.light) {
    getThemePreferences();
  }

  final IKeyValueStorage _storage;

  Future<void> getThemePreferences() async {
    final isDarkModeEnabled = await _storage.getBool('isDarkModeEnabled');
    value = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _storage.setBool('isDarkModeEnabled', value == ThemeMode.dark);
  }
}
