import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Показываем кнопку, когда прокрутка больше 300 пикселей
    if (_scrollController.offset >= 300 && !_showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = true;
      });
    } else if (_scrollController.offset < 300 && _showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'DriveClub',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                // Действие при нажатии на кнопку редактировать
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800], // Серый цвет
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Редактировать',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Верхняя строка с аватаром и статистикой
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Аватар (увеличенный)
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.person, color: Colors.white, size: 80),
                  ),
                  const SizedBox(width: 16),
                  
                  // Статистика
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem('20.1K', 'Подписчики'),
                        _buildStatItem('1.2K', 'Подписки'),
                        _buildStatItem('15', 'Постов'),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Имя и юзернейм
              const Text(
                'Иван Иванов',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '@ivanov',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Заголовок "О себе:"
              const Text(
                'О себе:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              
              // Описание
              const Text(
                'Это описание моего профиля. Здесь я рассказываю о себе и своих интересах.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              
              const SizedBox(height: 16),
              
             GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    childAspectRatio: 1,
  ),
  itemCount: 15,
  itemBuilder: (context, index) {
    return Container(
      margin: const EdgeInsets.all(20), // внешние отступы уменьшат видимый размер
      color: Colors.grey[800],
      child: const Icon(Icons.photo, color: Colors.grey, size: 16),
    );
  },
),
            ],
          ),
        ),
      ),
      // Плавающая кнопка "Наверх"
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.white,
              child: const Icon(Icons.arrow_upward, color: Colors.black),
            )
          : null,
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}