import 'package:flutter/material.dart';
import 'prof.dart'; // Импортируем страницу профиля
import 'authorization_page.dart'; // Импортируем страницу авторизации
import 'registration_page.dart'; // Импортируем страницу регистрации

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DriveClub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const AuthorizationPage(), // Стартовая страница - авторизация
      routes: {
        '/main': (context) => const DriveClubPage(),
        '/profile': (context) => const ProfPage(),
        '/auth': (context) => const AuthorizationPage(),
        '/registration': (context) => const RegistrationPage(),
      },
    );
  }
}

class DriveClubPage extends StatefulWidget {
  const DriveClubPage({super.key});

  @override
  _DriveClubPageState createState() => _DriveClubPageState();
}

class _DriveClubPageState extends State<DriveClubPage> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedSortOption;

  // Переменные для фильтрации
  String? _selectedBrand;
  String? _selectedModel;
  String? _selectedColor;
  String? _selectedYear;

  void _navigateToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ProfPage(),
      ),
    );
  }

  void _logout() {
    // Показываем диалог подтверждения выхода
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Выход',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Вы уверены, что хотите выйти?',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Отмена',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Переходим на страницу авторизации
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const AuthorizationPage(),
                  ),
                );
              },
              child: const Text(
                'Выйти',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // Функция для показа окна фильтрации с левой стороны
  void _showFilterDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25, // 1/4 экрана
              height: double.infinity,
              color: Colors.grey[900],
              child: _buildFilterContent(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Фильтрация',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          
          // Список фильтров
          Expanded(
            child: ListView(
              children: [
                _buildFilterItem('марка'),
                const SizedBox(height: 20),
                _buildFilterItem('модель'),
                const SizedBox(height: 20),
                _buildFilterItem('цвет'),
                const SizedBox(height: 20),
                _buildFilterItem('год'),
              ],
            ),
          ),
          
          // Кнопки искать и сбросить (горизонтально)
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      // Действие при нажатии на кнопку искать
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[800], // Серый цвет
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'искать',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedBrand = null;
                        _selectedModel = null;
                        _selectedColor = null;
                        _selectedYear = null;
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[800], // Серый цвет
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'сбросить',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[400],
          size: 16,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'DriveClub',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    hintText: 'Поиск...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Кнопка выхода (круглая, слева от аватара)
            GestureDetector(
              onTap: _logout,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[700],
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Аватар профиля
            GestureDetector(
              onTap: _navigateToProfile,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Центрированные кнопки фильтрации и сортировки
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Кнопка фильтрации
                    Container(
                      width: 200, // Уменьшенная ширина
                      height: 36,
                      child: TextButton(
                        onPressed: _showFilterDialog,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey[900],
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Фильтрация',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Кнопка сортировки
                    Container(
                      width: 200, // Уменьшенная ширина
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedSortOption,
                          isExpanded: true,
                          hint: Center(
                            child: Text(
                              'Сортировка',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
                          ),
                          dropdownColor: Colors.grey[900],
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSortOption = newValue;
                            });
                          },
                          items: <String>[
                            'По имени',
                            'По дате',
                            'По популярности',
                            'Без сортировки'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildPhotoItem('Саша Пулкин'),
              _buildPhotoItem('Мария Иванова'),
              _buildPhotoItem('Петр Петров'),
              _buildPhotoItem('Анна Сидорова'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoItem(String userName) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              userName,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.photo, color: Colors.grey, size: 50),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}