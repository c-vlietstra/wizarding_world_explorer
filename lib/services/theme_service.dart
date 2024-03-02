import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/services/shared_preferences_service.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.light);

  Future<void> loadThemeMode() async {
    await SharedPreferencesService.instance.init();
    bool isSetupCompleted = SharedPreferencesService.instance.isSetupCompleted();
    if (isSetupCompleted) {
      ThemeMode savedThemeMode = SharedPreferencesService.instance.getThemeMode();
      state = savedThemeMode;
    }
  }
}