import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for managing shared preferences.
///
/// This class provides methods for saving and retrieving user preferences using shared preferences.
/// To use this service, first call the [init] method to initialize the shared preferences instance.
/// Then, you can use the various methods to save and retrieve preferences.
/// Example usage:
/// ```dart
/// SharedPreferencesService().init();
/// SharedPreferencesService().saveThemeMode(ThemeMode.light);
/// ThemeMode currentTheme = SharedPreferencesService().getThemeMode();
/// ```
class SharedPreferencesService {
  SharedPreferencesService._privateConstructor();

  static final SharedPreferencesService _instance =
      SharedPreferencesService._privateConstructor();

  static SharedPreferencesService get instance => _instance;

  /// Factory constructor to access the singleton instance.
  factory SharedPreferencesService() {
    return _instance;
  }

  late SharedPreferences _prefs;

  /// Initializes the shared preferences instance.
  ///
  /// This method must be called before using any other methods in this class.
  /// It includes error handling to catch any exceptions that might occur during initialization.
  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      // Handle the exception, e.g., by logging it or showing an error message to the user
    }
  }

  // Constants for preference keys
  static const String _themeModeKey = 'themeMode';
  static const String _userNameKey = 'userName';
  static const String _userEmailKey = 'userEmail';
  static const String _setupCompletedKey = 'setupCompleted';

  /// Saves the theme mode preference.
  Future<bool> saveThemeMode(ThemeMode mode) async {
    return _prefs.setInt(_themeModeKey, mode.index);
  }

  /// Retrieves the saved theme mode preference.
  ThemeMode getThemeMode() {
    int index = _prefs.getInt(_themeModeKey) ?? ThemeMode.system.index;
    return ThemeMode.values[index];
  }

  /// Saves the user details (name and email).
  ///
  /// Returns true if the details were successfully saved.
  Future<bool> saveUserDetails(String name, String email) async {
    await _prefs.setString(_userNameKey, name);
    await _prefs.setString(_userEmailKey, email);
    return (_prefs.getString(_userNameKey) == name &&
        _prefs.getString(_userEmailKey) == email);
  }

  /// Retrieves the saved user details (name and email).
  Map<String, String> getUserDetails() {
    String name = _prefs.getString(_userNameKey) ?? '';
    String email = _prefs.getString(_userEmailKey) ?? '';
    return {'name': name, 'email': email};
  }

  /// Sets the setup completion flag.
  Future<bool> setSetupCompleted(bool isCompleted) async {
    return _prefs.setBool(_setupCompletedKey, isCompleted);
  }

  /// Checks if the setup is completed.
  ///
  /// Returns true if the setup is completed, false otherwise.
  bool isSetupCompleted() {
    return _prefs.getBool(_setupCompletedKey) ?? false;
  }
}
