import 'package:demofypappnoserver/controllers/profile_page_controller.dart';
import 'package:demofypappnoserver/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/custom_colours.dart';
import 'views/upload_books_page.dart';
import 'views/welcome_page.dart';

class TestPage extends StatelessWidget {
  final profilePageController = Get.put(ProfilePageController());
  TestPage({super.key});

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
                Get.to(TestPage());
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

                          // Edit profile form
                          Column(
                            children: [
                              TextFormField(
                                initialValue: user['username'],
                                decoration: const InputDecoration(
                                    labelText: 'New Username'),
                                onChanged: (value) {
                                  user['username'] = value;
                                },
                              ),
                              TextFormField(
                                initialValue: user['account_type'],
                                decoration: const InputDecoration(
                                    labelText: 'New Account Type'),
                                onChanged: (value) {
                                  user['account_type'] = value;
                                },
                              ),
                              TextFormField(
                                initialValue: user['diamonds'].toString(),
                                decoration: const InputDecoration(
                                    labelText: 'New Diamonds'),
                                onChanged: (value) {
                                  user['diamonds'] = int.tryParse(value) ?? 0;
                                },
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  profilePageController.updateProfile(
                                    user['id'],
                                    user['username'],
                                    user['account_type'],
                                    user['diamonds'],
                                  );
                                },
                                child: const Text('Save Changes'),
                              ),
                            ],
                          ),
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
