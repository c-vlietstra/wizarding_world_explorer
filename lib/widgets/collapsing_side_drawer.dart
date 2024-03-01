import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  const CollapsingNavigationDrawer({super.key});

  @override
  State<CollapsingNavigationDrawer> createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(itemBuilder: (context, counter) {
          return CollapsingListTile()
        })
      ],
    );
  }
}