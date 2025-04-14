import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;
  final String name;

  ThemeState({
    required this.themeMode,
    required this.name,
  });

  ThemeState copyWith({ThemeMode? themeMode, String? name}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      name: name ?? this.name,
    );
  }
}
