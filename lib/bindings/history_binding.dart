import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/history_controller.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<DataTodo>(() => DataTodo());
    Get.lazyPut<TaskMenuController>(() => TaskMenuController());
  }
}
