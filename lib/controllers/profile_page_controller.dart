import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[
    {
      "id": 1,
      "username": "zankodits",
      "account_type": "Normal Reader",
      "diamonds": 38,
    },
    {
      "id": 2,
      "username": "john_doe",
      "account_type": "Premium User",
      "diamonds": 50,
    },
    {
      "id": 3,
      "username": "alice_wonder",
      "account_type": "VIP Member (Uploader)",
      "diamonds": 75,
    },
    // Add more users as needed
  ].obs;

  // Function to update user profile
  void updateProfile(
      int userId, String newUsername, String newAccountType, int newDiamonds) {
    // // Find the user by ID
    // var user = users.firstWhere((element) => element["id"] == userId,
    //     orElse: () => null);

    // // Update user data
    // user["username"] = newUsername;
    // user["account_type"] = newAccountType;
    // user["diamonds"] = newDiamonds;
  }
}
