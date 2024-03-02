import 'package:flutter/material.dart';

class WizardsPage extends StatefulWidget {
  const WizardsPage({super.key});

  @override
  State<WizardsPage> createState() => _WizardsPageState();
}

class _WizardsPageState extends State<WizardsPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Wizards Page')
      ],
    );
  }
}