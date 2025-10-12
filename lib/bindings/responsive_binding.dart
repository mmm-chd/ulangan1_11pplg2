import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/responsive_controller.dart';

class ResponsiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveController>(() => ResponsiveController());
  }
}
