// lib/providers/current_screen_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/screens/home_screen.dart';
// Import other screens here

final currentScreenProvider = StateProvider<Widget>((ref) => const HomePage());