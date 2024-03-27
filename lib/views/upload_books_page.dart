import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UploadBooksController extends GetxController {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();

  Future<void> uploadBook() async {
    const url = 'http://10.0.2.2/practice_api/insert_books.php';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'bookName': bookNameController.text,
        'imagePath': imagePathController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        // Book uploaded successfully
        // You can show a success message or navigate to a different page
        print("Uploaded successfully");
      } else {
        print("Failed to upload");
      }
    } else {
      print("Something went wrong");
    }
  }
}

class UploadBooksPage extends StatelessWidget {
  final UploadBooksController controller = Get.put(UploadBooksController());

  UploadBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.bookNameController,
              decoration: const InputDecoration(labelText: 'Book Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.imagePathController,
              decoration: const InputDecoration(labelText: 'Image Path'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.uploadBook,
              child: const Text('Upload Book'),
            ),
          ],
        ),
      ),
    );
  }
}
