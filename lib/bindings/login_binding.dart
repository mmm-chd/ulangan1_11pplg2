import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/auth_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}