import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class HistoryController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  final TaskMenuController taskMenuController = Get.find<TaskMenuController>();

  RxBool complete = true.obs;

  List<ToDoItem> get completedList {
    return dataTodo.toDoItem
        .where((item) => item.isCompleted == complete.value)
        .toList().obs;
  }

  void onTapMenu(String value, int index) {
    taskMenuController.onTapItem(value, index);
  }
}
