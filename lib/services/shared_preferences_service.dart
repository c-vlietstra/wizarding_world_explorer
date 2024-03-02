import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._privateConstructor();

  static final SharedPreferencesService _instance = SharedPreferencesService._privateConstructor();

  static SharedPreferencesService get instance => _instance;

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Theme Mode
  Future<bool> saveThemeMode(ThemeMode mode) async {
    return await _prefs?.setString('themeMode', mode.toString()) ?? false;
  }

  ThemeMode getThemeMode() {
    final String? mode = _prefs?.getString('themeMode');
    switch (mode) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  // User Details
  Future<bool> saveUserDetails(String name, String email) async {
    await _prefs?.setString('userName', name);
    return await _prefs?.setString('userEmail', email) ?? false;
  }

  Map<String, String> getUserDetails() {
    String name = _prefs?.getString('userName') ?? '';
    String email = _prefs?.getString('userEmail') ?? '';
    return {'name': name, 'email': email};
  }

  // Setup Completion Flag
  Future<bool> setSetupCompleted(bool isCompleted) async {
    return await _prefs?.setBool('setupCompleted', isCompleted) ?? false;
  }

  bool isSetupCompleted() {
    return _prefs?.getBool('setupCompleted') ?? false;
  }
}
