import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/color.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (usernameController.text == 'abcd' &&
        passwordController.text == 'apacoba') {
      Get.snackbar(
        'Success',
        'Login successful',
        snackPosition: SnackPosition.BOTTOM,
        colorText: TextColor.primaryTextColor,
        backgroundColor: SupportColor.checkColor,
      );
    } else {
      Get.snackbar(
        'Wrong!!',
        'Invalid username or password',
        snackPosition: SnackPosition.BOTTOM,
        colorText: TextColor.primaryTextColor,
        backgroundColor: SupportColor.errorColor,
      );
    }
  }
}
