import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkIsLogin();
  }

  checkIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3));
    if (prefs.getString('username') != null &&
        prefs.getString('password') != null) {
      Get.offAllNamed(AppRoutes.navbarPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }

  @override
  void dispose() {
    super.dispose();
    SplashController().dispose();
  }
}
