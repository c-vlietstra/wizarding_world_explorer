import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/providers/current_screen_provider.dart';
import 'package:wizarding_world_explorer/widgets/collapsing_side_drawer.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScreen = ref.watch(currentScreenProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wizarding World Explorer'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 8.0,
      ),
      body: Stack(
        children: <Widget>[
          currentScreen,
          const CollapsingNavigationDrawer()
        ],
      )
    );
  }
}