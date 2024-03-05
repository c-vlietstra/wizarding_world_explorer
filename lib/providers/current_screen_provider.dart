// lib/providers/current_screen_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/screens/home_screen.dart';

// A provider for managing the current screen displayed in the application.
// Usage:
// - Use ref.watch(currentScreenProvider) to access the current screen widget.
// - Use ref.read(currentScreenProvider.notifier).state = newScreenWidget to update the current screen.
final currentScreenProvider = StateProvider<Widget>((ref) => const HomePage());
