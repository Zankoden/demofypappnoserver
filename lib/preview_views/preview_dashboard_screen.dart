import 'package:demofypappnoserver/preview_views/preview_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/custom_colours.dart';
import '../views/welcome_page.dart';

class PreviewDashBoardController extends GetxController {
  RxInt myIndex = 0.obs;

  void changeIndex(int index) {
    myIndex.value = index;
    if (index == 1) {
      // If the "Search" tab is selected, show a Snackbar
      Get.snackbar('Alert', 'Please login to continue');
    }
  }
}

class PreviewDashBoard extends StatelessWidget {
  final PreviewDashBoardController controller =
      Get.put(PreviewDashBoardController());

  PreviewDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Form(
                      child: Column(
                        children: [
                          const Icon(Icons.person),
                          Card(
                            elevation: 10,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 5,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 242, 240, 235),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 30, right: 30),
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: const BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Card(
                                    elevation: 8,
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Text(
                                          "Sign up",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(color: CustomColors.textColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                "Log out",
                style: TextStyle(color: CustomColors.textColor),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const WelcomePage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.myIndex.value,
          children: [
            PreviewHomePage(),
            PreviewHomePage(),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: controller.changeIndex,
        currentIndex: controller.myIndex.value,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }
}
