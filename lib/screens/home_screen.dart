import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/services/theme_service.dart';
import 'package:wizarding_world_explorer/widgets/collapsing_side_drawer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wizarding World Explorer'),
        actions: [
          Switch(
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              ref.read(themeModeProvider.notifier).state = value ? ThemeMode.dark : ThemeMode.light;
            },
          ),
        ],
      ),
      drawer: CollapsingNavigationDrawer(),
      body: Column()
    );
  }
}