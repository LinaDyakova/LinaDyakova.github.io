import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'main_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => const SecondScreen(),
    ),
    GoRoute(
      path: '/third',
      builder: (context, state) => const ThirdScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Navigation Lab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}