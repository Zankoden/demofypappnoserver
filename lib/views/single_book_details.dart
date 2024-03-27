import 'package:demofypappnoserver/controllers/single_book_details_controller.dart';
import 'package:demofypappnoserver/views/favourites_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SingleBookDetails extends StatelessWidget {
  final sbdC = Get.put(SingleBookDetailsController());
  final String bookName;
  final String imagePath;
  final String pdfFilePath;

  SingleBookDetails({
    super.key,
    required this.bookName,
    required this.imagePath,
    required this.pdfFilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 200, // Adjust the height as needed
              width: 150, // Adjust the width as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'Book Name: $bookName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Add to favourites:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Obx(() => IconButton(
                      onPressed: () {
                        sbdC.showFavBooks({
                          'bookName': bookName,
                          'imagePath': imagePath,
                          'pdfFilePath': pdfFilePath,
                        });
                        sbdC.toggleOutline(); // this method toggles the value of outline
                      },
                      icon: Icon(sbdC.outline.value
                          ? Icons.bookmark_outline
                          : Icons.bookmark),
                    )),
              ],
            ),
            InkWell(
              onTap: () {
                Get.to(FavouritesPage());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Check my fav List:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.list),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (pdfFilePath.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return PdfViewerScreen(pdfFilePath: pdfFilePath);
                    }),
                  );
                } else {
                  // Show a message when pdfFilePath is empty
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('PDF Not Available'),
                        content: const Text(
                            'Sorry, the PDF is not available at the moment. You can try browsing other books.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Read"),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfViewerScreen extends StatelessWidget {
  final String pdfFilePath;

  const PdfViewerScreen({super.key, required this.pdfFilePath});

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Viewer'),
        ),
        body: SfPdfViewer.asset(pdfFilePath),
      );
    } catch (e) {
      print("Error loading PDE: $e");
      return Scaffold(
        appBar: AppBar(
          title: const Text("PDF Viewer - Error"),
        ),
        body: const Center(
          child: Text('PDF not available or there was an error loading it.'),
        ),
      );
    }
  }
}
