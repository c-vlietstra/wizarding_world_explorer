import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationModel {
  late String title;
  late IconData icon;

  NavigationModel({
    required this.title,
    required this.icon
  });
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Home', icon: Icons.home),
  NavigationModel(title: 'Houses', icon: FontAwesomeIcons.fortAwesomeAlt),
  NavigationModel(title: 'Elixirs', icon: FontAwesomeIcons.flaskVial),
  NavigationModel(title: 'Ingredients', icon: FontAwesomeIcons.seedling),
  NavigationModel(title: 'Wizards', icon: FontAwesomeIcons.hatWizard),
];