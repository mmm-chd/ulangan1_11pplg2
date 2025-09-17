import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool isCheck = false.obs;

  //  Toogle Password
  bool showPassword() => !isPasswordVisible.value;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    getPasswordIcon();
  }

  IconData getPasswordIcon() {
    return isPasswordVisible.value ? Icons.visibility : Icons.visibility_off;
  }

  // Remember Me
  bool checked() => isCheck.value;

  void toogleRememberMe(bool? value) {
    isCheck.value = !isCheck.value;
  }

  // Login
  void login() async {
    if (usernameController.text == 'Matthew' &&
        passwordController.text == 'abcd') {
      Get.snackbar(
        'Success',
        'Login successful',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        colorText: SupportColor.whiteColor,
        backgroundColor: SupportColor.checkColor,
        animationDuration: Duration(milliseconds: 300),
        duration: Duration(milliseconds: 700),
      );

      await Future.delayed(Duration(seconds: 1));
      await Get.offNamed(AppRoutes.navbarPage);
    } else {
      Get.snackbar(
        'Wrong!!',
        'Invalid username or password',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        colorText: SupportColor.whiteColor,
        backgroundColor: SupportColor.errorColor,
        animationDuration: Duration(milliseconds: 300),
        duration: Duration(milliseconds: 800),
      );
    }
  }
}
