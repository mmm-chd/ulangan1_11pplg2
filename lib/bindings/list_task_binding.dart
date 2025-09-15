import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/list_task_controller.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class ListTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTaskController>(() => ListTaskController(), fenix: true);
    Get.lazyPut<DataTodo>(() => DataTodo(), fenix: true);
    Get.lazyPut<TaskMenuController>(() => TaskMenuController(), fenix: true);
  }
}
