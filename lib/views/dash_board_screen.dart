import 'package:demofypappnoserver/views/favourites_page.dart';
import 'package:demofypappnoserver/views/profile_page.dart';
import 'package:demofypappnoserver/views/upload_books_page.dart';
import 'package:demofypappnoserver/resources/custom_colours.dart';
import 'package:demofypappnoserver/views/search_page.dart';
import 'package:demofypappnoserver/views/home_page.dart';
import 'package:demofypappnoserver/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  String getAppBarTitle() {
    if (currentIndex.value == 0) {
      return "Home";
    } else if (currentIndex.value == 1) {
      return "Search";
    } else if (currentIndex.value == 2) {
      return "Favourites";
    }
    return "";
  }

  List<Widget> widgetList = [
    HomePage(),
    SearchPage(),
    FavouritesPage(),
  ];

  void onTabTapped(int index) {
    currentIndex.value = index;
  }
}

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        elevation: 2,
        title: Row(
          children: [
            Obx(() => Text(controller.getAppBarTitle())),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Get.to(ProfilePage());
              },
              child: const Row(
                children: [CircleAvatar(child: Icon(Icons.person))],
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
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
            ListTile(
              leading: const Icon(Icons.upload),
              title: Text(
                "Upload",
                style: TextStyle(color: CustomColors.textColor),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return UploadBooksPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.widgetList,
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: controller.onTabTapped,
            currentIndex: controller.currentIndex.value,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favourites"),
            ],
          )),
    );
  }
}
