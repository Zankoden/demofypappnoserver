import 'package:get/get.dart';

class SingleBookDetailsController extends GetxController {
  var outline = true.obs;
  var favoriteBooks = <Map<String, dynamic>>[].obs;
  void toggleOutline() {
    outline.value = !outline.value;
  }

  void showFavBooks(Map<String, dynamic> bookDetails) {
    if (outline.value) {
      // Add the book to favorites
      favoriteBooks.add(bookDetails);
      print("Added to favorites $bookDetails");
    } else {
      // Remove the book from favorites
      favoriteBooks
          .removeWhere((book) => book['bookName'] == bookDetails['bookName']);
      print("Removed from favorites");
    }
  }
}
