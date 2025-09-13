import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/home_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DataTodo>(() => DataTodo());
  }
}
