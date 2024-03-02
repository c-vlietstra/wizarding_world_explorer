import 'package:flutter/material.dart';

class SpellsPage extends StatefulWidget {
  const SpellsPage({Key? key}) : super(key: key);

  @override
  State<SpellsPage> createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Spells Page')
      ],
    );
  }
}