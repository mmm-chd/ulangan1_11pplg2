import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataTodo(), permanent: true);
  }
}
