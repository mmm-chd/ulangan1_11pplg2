import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class HistoryController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  final TaskMenuController taskMenuController = Get.find<TaskMenuController>();

  RxBool complete = true.obs;

  RxList<ToDoItem> get completedList {
    return dataTodo.toDoItem
        .where((item) => item.isCompleted == complete.value)
        .toList()
        .obs;
  }

  void deleteAll() {
    dataTodo.toDoItem.removeWhere((item) => item.isCompleted == complete.value);
  }

  void onTapMenu(String value, int index, bool isCompleted) {
    final todoItem = completedList[index];
    final actualIndex = dataTodo.toDoItem.indexOf(todoItem);

    if (actualIndex != -1) {
      taskMenuController.onTapItem(value, actualIndex, isCompleted);

      if (value == 'completed') {
        update();
      }
    }
  }
}
