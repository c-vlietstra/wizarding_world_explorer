import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/widgets/collapsing_side_drawer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wizarding World Explorer'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 8.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(),
          const CollapsingNavigationDrawer()
        ],
      )
    );
  }
}