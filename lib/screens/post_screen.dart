import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PostBlogScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post a Blog')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description')),
            TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await apiService.createBlog(
                  titleController.text,
                  descriptionController.text,
                  DateTime.now().toIso8601String(),
                  categoryController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
