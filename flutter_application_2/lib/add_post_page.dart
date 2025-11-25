// add_post_page.dart
import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final TextEditingController _descriptionController = TextEditingController();
  List<String> _selectedImages = [];

  void _addImage() {
    // В реальном приложении здесь будет логика выбора изображений из галереи
    setState(() {
      _selectedImages.add('image_${_selectedImages.length + 1}');
    });
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _publishPost() {
    // Здесь будет логика публикации
    final description = _descriptionController.text;
    if (description.isNotEmpty || _selectedImages.isNotEmpty) {
      // В реальном приложении здесь будет сохранение в базу данных
      print('Публикация: $description, изображений: ${_selectedImages.length}');
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Новая публикация',
          style: TextStyle(color: Colors.white),
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
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: _publishPost,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Поле для описания
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Добавьте описание...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Заголовок для фотографий
            const Text(
              'Фотографии:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 10),
            
            // Кнопка добавления фотографий
            ElevatedButton(
              onPressed: _addImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_photo_alternate),
                  SizedBox(width: 8),
                  Text('Добавить фотографии'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Сетка выбранных фотографий
            Expanded(
              child: _selectedImages.isEmpty
                  ? const Center(
                      child: Text(
                        'Фотографии не добавлены',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _selectedImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              color: Colors.grey[800],
                              child: const Center(
                                child: Icon(Icons.photo, color: Colors.grey, size: 40),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.close, color: Colors.white, size: 20),
                                onPressed: () => _removeImage(index),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}