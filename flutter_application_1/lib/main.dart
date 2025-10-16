// lib/main.dart (полная версия)
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _onButtonPressed() {
    print('Button pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторная работа №1'),
      ),
      body: Column(
        children: [
          // Первый контейнер
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.purpleAccent,
            child: const Center(
              child: Text(
                'Me mew meow moew moew me mew moew',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // Row с тремя текстовыми элементами
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'MEOW',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'meow',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'MEOW',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          
          // Второй контейнер
          Container(
            width: 200,
            height: 150,
            color: Colors.purple,
            child: const Center(
              child: Text(
                'Meow me meow meoww mew mow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          
          // Expanded с CircleAvatar
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.deepPurple,
                    child: const Text(
                      'блабла',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://avatars.mds.yandex.net/get-yapic/27232/2QFrz3lyfCtG4z1lnfoDbaI-1/orig',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onButtonPressed,
        tooltip: 'Пикми',
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}