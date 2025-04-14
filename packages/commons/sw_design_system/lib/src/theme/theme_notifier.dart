import 'package:flutter/material.dart';
import 'package:sw_dependencies/sw_dependencies.dart';
import 'package:sw_design_system/src/theme/theme_state.dart';

class ThemeNotifier extends ValueNotifier<ThemeState> {
  ThemeNotifier({required IKeyValueStorage storage})
      : _storage = storage,
        super(ThemeState(themeMode: ThemeMode.light, name: '')) {
    getThemePreferences();
  }

  final IKeyValueStorage _storage;

  Future<void> getThemePreferences() async {
    final isDarkModeEnabled = await _storage.getBool('isDarkModeEnabled');
    value = value.copyWith(themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme(bool isDark) async {
    value = value.copyWith(themeMode: isDark ? ThemeMode.light : ThemeMode.dark);
    await _storage.setBool('isDarkModeEnabled', isDark ? true : false);
  }

  void updateName(String newName) {
    value = value.copyWith(name: newName);
  }
}
