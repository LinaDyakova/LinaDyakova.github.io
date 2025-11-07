import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Можно использовать как pop, так и pushNamed('/')
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Text('Back to Main'),
        ),
      ),
    );
  }
}