import 'package:demofypappnoserver/views/single_book_details.dart';
import 'package:flutter/material.dart';

class NewSingleBookDisplay extends StatelessWidget {
  const NewSingleBookDisplay({
    Key? key,
    required this.bookName,
    required this.imagePath,
    required this.pdfFilePath,
    // required this.myBook,
  }) : super(key: key);

  final String bookName;
  final String imagePath;
  final String pdfFilePath;
  // final AllBooksData myBook;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return SingleBookDetails(
              bookName: bookName,
              imagePath: imagePath,
              pdfFilePath: pdfFilePath,
            );
          }),
        );
      },
      child: SizedBox(
        height: 160, // Adjust the height as needed
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Container(
                  height: 110,
                  width: 90,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 81, 51, 51),
                    // borderRadius: const BorderRadius.all(
                    //   Radius.circular(22),
                    // ),
                    image: DecorationImage(
                      // image: AssetImage(myBook.bookImagePath ?? ""),
                      image: AssetImage(imagePath),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 5), // Adjust the spacing between image and text
              Center(
                child: Text(
                  // myBook.bookName ?? "",
                  bookName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2, // Adjust the number of lines as needed
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
