import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/list_task_controller.dart';

class ListTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTaskController>(() => ListTaskController());
  }
}
