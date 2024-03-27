class Book {
  String bookName;
  String bookImagePath;
  String pdfPath;

  Book({
    required this.bookName,
    required this.bookImagePath,
    required this.pdfPath,
  });
}

List<Book> bookList = [
  Book(
    bookName: "48 Laws Of Power",
    bookImagePath: "assets/book1test.png",
    pdfPath: "assets/48lawsofpower.pdf",
  ),
  Book(
    bookName: "Shreemad Bhagavad",
    bookImagePath: "assets/geetaBook.jpg",
    pdfPath: "assets/geeta.pdf",
  ),
  Book(
    bookName: "King: A Life",
    bookImagePath: "assets/kingALifeBook.jpg",
    pdfPath: "",
  ),
  // Add more books as needed
];