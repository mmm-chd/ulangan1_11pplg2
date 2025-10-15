import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/data/db_helper.dart';
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

  //Hapus semua completed
  void deleteAll() async {
    dataTodo.toDoItem.removeWhere((item) => item.isCompleted);
    await DbHelper().deleteAllCompleted();
  }

  // //Hapus satu item
  // void deleteById(int id) {
  //   dataTodo.toDoItem.removeWhere((item) => item.id == id);
  // }

  //delete atau restore
  Future<void> onTapMenu(String value, int index, bool isCompleted) async {
    final todoItem = completedList[index];
    final actualIndex = dataTodo.toDoItem.indexOf(todoItem);

    if (actualIndex != -1) {
      taskMenuController.onTapItem(value, index, isCompleted);
    }
  }
}
