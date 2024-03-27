import 'package:demofypappnoserver/resources/custom_colours.dart';
import 'package:demofypappnoserver/test_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_widgets/book_widget.dart';
import '../models/books_list.dart';

class AllBooksController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<Book> books = <Book>[].obs;
  List<Book> originalBooks = [];

  @override
  void onInit() {
    super.onInit();
    // Initialize originalBooks with a copy of the original list
    originalBooks = List<Book>.from(bookList);
    // Initialize books with the original list
    books.assignAll(originalBooks);
  }

  void updateList(String value) {
    // If the search value is empty, show all books
    if (value.isEmpty) {
      books.assignAll(originalBooks);
    } else {
      // Filter books based on the search query
      books.assignAll(originalBooks
          .where((element) =>
              element.bookName.toLowerCase().contains(value.toLowerCase()))
          .toList());
    }
  }
}

class AllBooks extends StatelessWidget {
  final AllBooksController controller = Get.put(AllBooksController());

  AllBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        elevation: 2,
        title: Row(
          children: [
            Text("All Books", style: TextStyle(color: CustomColors.textColor)),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(TestPage());
                  },
                  child: const CircleAvatar(child: Icon(Icons.person)),
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: CustomColors.backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Search Your Fav Books Here",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontSize: 15,
                ),
              ),
            ),
            TextField(
              controller: controller.searchController,
              onChanged: (value) => controller.updateList(value),
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Shreemad Bhagavada Geeta",
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 146, 145, 145),
                ),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.purple,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "All Books",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.books.isEmpty) {
                  return Center(
                    child: Text(
                      "No results found",
                      style: TextStyle(color: CustomColors.textColor),
                    ),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1),
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: controller.books.length,
                    itemBuilder: (context, index) {
                      return NewSingleBookDisplay(
                        bookName: controller.books[index].bookName,
                        imagePath: controller.books[index].bookImagePath,
                        pdfFilePath: controller.books[index].pdfPath,
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
