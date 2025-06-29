import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Welcome to Home Screen', style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
