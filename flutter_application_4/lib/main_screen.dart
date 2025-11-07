import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'second_screen.dart';
import 'third_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Базовая навигация
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecondScreen()),
                );
              },
              child: const Text('Go to Second (Push)'),
            ),
            const SizedBox(height: 10),
            
            // Named Routes (оставлено для сравнения)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go to Second (Named)'),
            ),
            const SizedBox(height: 10),
            
            // GoRouter
            ElevatedButton(
              onPressed: () {
                context.push('/second');
              },
              child: const Text('Go to Second (GoRouter)'),
            ),
            const SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                context.push('/third');
              },
              child: const Text('Go to Third (GoRouter)'),
            ),
          ],
        ),
      ),
    );
  }
}