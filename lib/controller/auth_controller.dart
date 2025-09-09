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
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        colorText: TextColor.primaryTextColor,
        backgroundColor: SupportColor.checkColor,
        animationDuration: Duration(milliseconds: 300),
        duration: Duration(milliseconds: 800),
      );
    } else {
      Get.snackbar(
        'Wrong!!',
        'Invalid username or password',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        colorText: TextColor.primaryTextColor,
        backgroundColor: SupportColor.errorColor,
        animationDuration: Duration(milliseconds: 300),
        duration: Duration(milliseconds: 800),
      );
    }
  }
}
