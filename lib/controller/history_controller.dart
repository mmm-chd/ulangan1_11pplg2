import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/data/db_helper.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class HistoryController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  final TaskMenuController taskMenuController = Get.find<TaskMenuController>();

  RxList<ToDoItem> completedList = <ToDoItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCompleted();
  }

  // Load completed
  void _loadCompleted() {
    completedList.value =
        dataTodo.toDoItem.where((item) => item.isCompleted).toList();
  }

  //Hapus semua completed
  void deleteAll() {
    dataTodo.toDoItem.removeWhere((item) => item.isCompleted);
    _loadCompleted();
  }

  //Hapus satu item
  void deleteById(int id) {
    dataTodo.toDoItem.removeWhere((item) => item.id == id);
    _loadCompleted();
  }

  //delete atau restore
  void onTapMenu(String value, int index) async {
  final todoItem = completedList[index];
  final actualIndex = dataTodo.toDoItem.indexOf(todoItem);

  if (actualIndex != -1) {
    if (value == 'delete') {
      dataTodo.toDoItem.removeAt(actualIndex);
      await DbHelper().deleteById(todoItem.id!);
    } else if (value == 'restore') {
      dataTodo.toDoItem[actualIndex].isCompleted = false;
    }
    _loadCompleted();
  }
}

  //Dipanggil dari HomeController ketika task di-mark completed
  void refresh() {
    _loadCompleted();
  }
}
