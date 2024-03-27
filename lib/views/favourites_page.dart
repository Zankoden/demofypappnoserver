import 'package:demofypappnoserver/controllers/single_book_details_controller.dart';
import 'package:demofypappnoserver/views/all_books.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/book_widget.dart';

class FavouritesPage extends StatelessWidget {
  final sbdc = Get.put(SingleBookDetailsController());
  FavouritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Obx(() {
              if (sbdc.favoriteBooks.isEmpty) {
                // Display "No saved books" text when there are no favorite books
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'No saved books',
                          style: TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(AllBooks());
                            },
                            child: const Text("Explore"))
                      ]),
                );
              } else {
                // Display the list of favorite books
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1),
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: sbdc.favoriteBooks.length,
                  itemBuilder: (context, index) {
                    final book = sbdc.favoriteBooks[index];
                    return NewSingleBookDisplay(
                      bookName: book['bookName'].toString(),
                      imagePath: book['imagePath'].toString(),
                      pdfFilePath: book['pdfFilePath'].toString(),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
