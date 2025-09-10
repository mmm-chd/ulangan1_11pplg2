import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());
  }
}
