import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.green,
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
                  MaterialPageRoute(builder: (_) => const ThirdScreen()),
                );
              },
              child: const Text('Go to Third (Push)'),
            ),
            const SizedBox(height: 10),
            
            // Named Routes
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Go to Third (Named)'),
            ),
            const SizedBox(height: 10),
            
            // GoRouter
            ElevatedButton(
              onPressed: () {
                context.push('/third');
              },
              child: const Text('Go to Third (GoRouter)'),
            ),
            const SizedBox(height: 10),
            
            // Возврат разными способами
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back (Pop)'),
            ),
            const SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Back (GoRouter pop)'),
            ),
          ],
        ),
      ),
    );
  }
}