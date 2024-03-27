import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demofypappnoserver/custom_widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/custom_colours.dart';
import '../views/home_page.dart';

class PreviewHomePageController extends GetxController {
  RxList<Map<String, dynamic>> books = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch books when the home page is created
    getBooks();
  }

  Future<void> getBooks() async {
    try {
      var res = await http
          .get(Uri.parse("http://10.0.2.2/practice_api/get_my_books.php"));
      var response = jsonDecode(res.body);

      print("Raw Response: $response");

      if (response is List) {
        books.value = List.from(response);
      } else {
        print("Failed to retrieve books: Invalid response format");
      }
    } catch (e) {
      print(e);
    }
  }
}

class PreviewHomePage extends StatelessWidget {
  final PreviewHomePageController controller =
      Get.put(PreviewHomePageController());

  PreviewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 735,
                  decoration:
                      BoxDecoration(color: CustomColors.backgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                        ),
                        items: imgList.map(
                          (item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Image.network(
                                    item,
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.only(right: 35),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Sign in to continue reading and downloading PDFs of your favourite books",
                              style: TextStyle(
                                color: CustomColors.textColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          SizedBox(width: 30),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Popular Picks of the Week!",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.textColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Expanded(
                        child: Obx(() {
                          if (controller.books.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 1),
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 0,
                              ),
                              itemCount: controller.books.length,
                              itemBuilder: (context, index) {
                                return NewSingleBookDisplay(
                                  bookName: controller.books[index]["BookName"],
                                  imagePath: controller.books[index]
                                      ["BookImagePath"],
                                  pdfFilePath: 'PdfPath',
                                );
                              },
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please login to continue"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: CustomColors.buttonColor,
                ),
                child: const Text(
                  "All Books",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
