import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Возврат на главный экран
            ElevatedButton(
              onPressed: () {
                // Используем go для сброса стека навигации
                context.go('/');
              },
              child: const Text('Go to Main (Reset stack)'),
            ),
            const SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                // Простой возврат
                context.pop();
              },
              child: const Text('Back (GoRouter pop)'),
            ),
            const SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                // Возврат к определенному маршруту
                context.go('/second');
              },
              child: const Text('Go to Second (Reset)'),
            ),
          ],
        ),
      ),
    );
  }
}