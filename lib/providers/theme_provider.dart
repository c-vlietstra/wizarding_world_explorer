import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/services/theme_service.dart';

// A StateNotifierProvider for managing the ThemeMode of the application.
// Usage:
// - Use ref.watch(themeModeProvider) to access the current ThemeMode.
// - Use ref.read(themeModeProvider.notifier).state = newThemeMode to update the ThemeMode.
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  // The provider creates an instance of ThemeModeNotifier to manage the ThemeMode state.
  (ref) => ThemeModeNotifier(),
);
