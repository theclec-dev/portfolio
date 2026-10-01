import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeController {
  ThemeController._();
  static final ThemeController _instance = ThemeController._();
  factory ThemeController() => _instance;

  final themeModeProvider = StateProvider<ThemeMode>((ref) {
    return ThemeMode.system;
  });
}

const themeModePrefsKey = 'themeMode';

ThemeMode themeModeFromPrefs(String? value) {
  switch (value) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

String themeModeToPrefs(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return 'light';
    case ThemeMode.dark:
      return 'dark';
    case ThemeMode.system:
      return 'system';
  }
}
