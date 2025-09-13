import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
