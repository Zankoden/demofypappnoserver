import 'package:demofypappnoserver/resources/custom_colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../custom_widgets/book_widget.dart';
import '../models/books_list.dart';
import '../views/all_books.dart';

final List<String> imgList = [
  'assets/sliderImages/image1.png',
  'assets/sliderImages/image2.png',
  'assets/sliderImages/image3.png',
  'assets/sliderImages/image4.png',
  'assets/sliderImages/image5.png',
  'assets/sliderImages/image6.png',
];

class HomePageController extends GetxController {
  final books = bookList.obs;
}

class HomePage extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());

  HomePage({super.key});

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
                          height: 170.0,
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
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                  // child: Image.network(
                                  //   item,
                                  //   fit: BoxFit.cover,
                                  //   height: 100,
                                  // ),
                                );
                              },
                            );
                          },
                        ).toList(),
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
                        child: Obx(
                          () => GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 1),
                              crossAxisCount:
                                  3, // Adjust the number of items in a row
                              crossAxisSpacing:
                                  20, // Adjust spacing between items horizontally
                              mainAxisSpacing:
                                  0, // Adjust spacing between items vertically
                            ),
                            itemCount: controller.books.length,
                            itemBuilder: (context, index) {
                              return NewSingleBookDisplay(
                                bookName: controller.books[index].bookName,
                                imagePath:
                                    controller.books[index].bookImagePath,
                                pdfFilePath: controller.books[index].pdfPath,
                              );
                            },
                          ),
                        ),
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
                  Get.to(AllBooks());
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
