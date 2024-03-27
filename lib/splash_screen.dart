import 'dart:async';

import 'package:demofypappnoserver/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      Get.off(const WelcomePage());
    });
  }
}

class SplashScreen extends StatelessWidget {
  final SplashScreenController controller = Get.put(SplashScreenController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 107, 97, 97),
        child: const Center(
          child: Text(
            "Ebooks Point",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 174, 167, 167),
            ),
          ),
        ),
      ),
    );
  }
}
