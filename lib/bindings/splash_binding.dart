import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/splash_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.put(DataTodo(), permanent: true);
  }
}
