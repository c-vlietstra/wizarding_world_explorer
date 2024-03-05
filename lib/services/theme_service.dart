import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/services/shared_preferences_service.dart';

// A StateNotifier that manages the ThemeMode of the application.
// Usage:
// - Instantiate ThemeModeNotifier and call loadThemeMode() to load the saved theme mode from shared preferences.
// - Access the current theme mode using the state property.
// - Update the theme mode by setting the state property to a new ThemeMode value.
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  // Initialize the state with the default theme mode (light).
  ThemeModeNotifier() : super(ThemeMode.light);

  // Loads the theme mode from shared preferences and updates the state.
  Future<void> loadThemeMode() async {
    // Initialize the SharedPreferencesService.
    await SharedPreferencesService.instance.init();
    // Check if the setup process has been completed.
    bool isSetupCompleted = SharedPreferencesService.instance.isSetupCompleted();
    if (isSetupCompleted) {
      // Retrieve the saved theme mode from shared preferences.
      ThemeMode savedThemeMode = SharedPreferencesService.instance.getThemeMode();
      // Update the state with the saved theme mode.
      state = savedThemeMode;
    }
  }
}
