import 'package:flutter/material.dart';
import 'package:sw_design_system/src/theme/theme_notifier.dart';

class ThemeInheritedNotifier extends InheritedNotifier<ThemeNotifier> {
  const ThemeInheritedNotifier({
    super.key,
    super.notifier,
    required super.child,
  });

  static ThemeNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeInheritedNotifier>()!
        .notifier!;
  }
}
