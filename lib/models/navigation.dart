import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wizarding_world_explorer/screens/elixirs_screen.dart';
import 'package:wizarding_world_explorer/screens/home_screen.dart';
import 'package:wizarding_world_explorer/screens/houses_screen.dart';
import 'package:wizarding_world_explorer/screens/ingredients_page.dart';
//import 'package:wizarding_world_explorer/screens/settings_screen.dart';
import 'package:wizarding_world_explorer/screens/setup_screen.dart';
import 'package:wizarding_world_explorer/screens/wizards_screen.dart';

class NavigationModel {
  late String title;
  late IconData icon;
  late Widget screen;

  NavigationModel({
    required this.title,
    required this.icon,
    required this.screen,
  });
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Home', icon: Icons.home, screen: const HomePage()),
  NavigationModel(title: 'Houses', icon: FontAwesomeIcons.fortAwesomeAlt, screen: const HousesPage()),
  NavigationModel(title: 'Elixirs', icon: FontAwesomeIcons.flaskVial, screen: const ElixirsPage()),
  NavigationModel(title: 'Ingredients', icon: FontAwesomeIcons.seedling, screen: const IngredientsPage()),
  NavigationModel(title: 'Wizards', icon: FontAwesomeIcons.hatWizard, screen: const WizardsPage()),
  NavigationModel(title: 'Settings', icon: FontAwesomeIcons.userGear, screen: const SetupPage()),
];