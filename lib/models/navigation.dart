import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wizarding_world_explorer/screens/elixirs_screen.dart';
import 'package:wizarding_world_explorer/screens/home_screen.dart';
import 'package:wizarding_world_explorer/screens/houses_screen.dart';
import 'package:wizarding_world_explorer/screens/ingredients_screen.dart';
import 'package:wizarding_world_explorer/screens/settings_screen.dart';
import 'package:wizarding_world_explorer/screens/spells_screen.dart';
import 'package:wizarding_world_explorer/screens/wizards_screen.dart';

// A class representing a navigation item in the application.
class NavigationModel {
  // The title of the navigation item.
  late String title;
  // The icon associated with the navigation item.
  late IconData icon;
  // The screen widget that the navigation item navigates to.
  late Widget screen;

  // Constructor for the NavigationModel class.
  NavigationModel({
    required this.title,
    required this.icon,
    required this.screen,
  });
}

// A list of NavigationModel objects representing the navigation items in the application.
List<NavigationModel> navigationItems = [
  // Navigation item for the Home screen.
  NavigationModel(title: 'Home', icon: Icons.home, screen: const HomePage()),
  // Navigation item for the Houses screen.
  NavigationModel(title: 'Houses', icon: FontAwesomeIcons.fortAwesomeAlt, screen: const HousesPage()),
  // Navigation item for the Elixirs screen.
  NavigationModel(title: 'Elixirs', icon: FontAwesomeIcons.flaskVial, screen: const ElixirsPage()),
  // Navigation item for the Spells screen.
  NavigationModel(title: 'Spells', icon: FontAwesomeIcons.wandSparkles, screen: const SpellsPage()),
  // Navigation item for the Ingredients screen.
  NavigationModel(title: 'Ingredients', icon: FontAwesomeIcons.seedling, screen: const IngredientsPage()),
  // Navigation item for the Wizards screen.
  NavigationModel(title: 'Wizards', icon: FontAwesomeIcons.hatWizard, screen: const WizardsPage()),
  // Navigation item for the Settings screen.
  NavigationModel(title: 'Settings', icon: FontAwesomeIcons.userGear, screen: const SettingsPage()),
];
