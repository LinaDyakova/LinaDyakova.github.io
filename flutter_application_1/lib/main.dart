// lib/main.dart
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

  void _onButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _dropdownController = TextEditingController();
    List<String> _options = ['Apple', 'Banana', 'Orange'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторная работа №1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(2, 4),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  'Me mew meow moew moew me mew moew',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            
            // Добавленный DropdownMenu
            Container(
              padding: const EdgeInsets.all(16),
              child: DropdownMenu(
                controller: _dropdownController,
                label: const Text('Выберите фрукт'),
                onSelected: (String? selectedFruit) {
                  // Обработка выбранного фрукта
                  if (selectedFruit != null) {
                    print('Выбран фрукт: $selectedFruit');
                  }
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: 'k',
                    label: 'k',
                  )
                        ]              ),
            ),
            
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'MEOW',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    'meow',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'MEOW',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.deepPurple],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text(
                  'Meow me meow meoww mew mow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            Container(
              height: 200, 
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.deepPurple,
                    child: const Text(
                      'блабла',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onButtonPressed(context),
        tooltip: 'Пикми',
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _secondDropdownController = TextEditingController();
    List<String> _secondOptions = ['Option 1', 'Option 2', 'Option 3'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Вторая страница'),
        automaticallyImplyLeading: false, 
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE1BEE7),
              Color(0xFFCE93D8),
              Color(0xFFBA68C8),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Анимированная иконка котика
              const Icon(
                Icons.pets,
                size: 100,
                color: Colors.white,
              ),
              
              const SizedBox(height: 30),
              
              // DropdownMenu на второй странице
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownMenu<String>(
                  controller: _secondDropdownController,
                  width: 250,
                  label: const Text('Выберите опцию'),
                  onSelected: (String? selectedOption) {
                    // Обработка выбранной опции
                    if (selectedOption != null) {
                      print('Выбрана опция: $selectedOption');
                    }
                  },
                  dropdownMenuEntries: _secondOptions.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Красивая карточка с текстом
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Мяу! 🐱',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Вы успешно перешли на вторую страницу!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Дополнительная информация в стиле "meow"
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'meow mew meow mew meow\nmew meow mew meow mew',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.deepPurple,
        tooltip: 'Назад',
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }
}