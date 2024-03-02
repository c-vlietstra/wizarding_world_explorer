import 'package:flutter/material.dart';

class ElixirsPage extends StatefulWidget {
  const ElixirsPage({super.key});

  @override
  State<ElixirsPage> createState() => _ElixirsPageState();
}

class _ElixirsPageState extends State<ElixirsPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Elixirs Page')
      ],
    );
  }
}