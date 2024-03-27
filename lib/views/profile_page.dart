import 'package:demofypappnoserver/controllers/profile_page_controller.dart';
import 'package:demofypappnoserver/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/custom_colours.dart';
import 'upload_books_page.dart';
import 'welcome_page.dart';

class ProfilePage extends StatelessWidget {
  final profilePageController = Get.put(ProfilePageController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        elevation: 2,
        title: Row(
          children: [
            const Text("Profile Page"),
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
                Get.to(HomePage());
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/dog profile.jpg"),
                radius: 60,
              ),
              const SizedBox(height: 70),
              Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Obx(() {
                    // Check if the users list is not empty
                    if (profilePageController.users.isNotEmpty) {
                      // Assuming you want to display the first user in the list
                      var user = profilePageController.users[0];

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Username: ${user['username']}"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Account Type: ${user['account_type']}"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Diamonds: ${user['diamonds']} 💎"),
                            ],
                          ),
                          const SizedBox(height: 8),

                          //Edit profile form
                          const Card(
                            elevation: 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 8),
                          )
                        ],
                      );
                    } else {
                      // Display a loading indicator or an empty state
                      return const CircularProgressIndicator();
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
