import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (usernameController.text == 'abcd' &&
        passwordController.text == 'apacoba') {
      Get.snackbar(
        'Success',
        'Login successful',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.purpleAccent,
      );
    } else {
      Get.snackbar(
        'Wrong!!',
        'Invalid username or password',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
