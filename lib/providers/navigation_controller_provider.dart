import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/screens/main_screen.dart';

// A provider for creating and providing a NavigationController instance.
// Usage:
// - Use ref.read(navigationControllerProvider) to access the NavigationController instance.
final navigationControllerProvider = Provider((ref) => NavigationController());

// A class responsible for navigation-related actions.
class NavigationController {
  // Navigates to the MainPage and replaces the current route in the navigation stack.
  // This is typically used when navigating from a splash screen or setup screen to the main part of the app.
  void navigateToMainPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }
}
