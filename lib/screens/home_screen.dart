import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          'Welcome to the enchanting realm of wizards, goblins, and ghouls. This app was crafted to guide you through a world filled with both delights and dangers.',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
