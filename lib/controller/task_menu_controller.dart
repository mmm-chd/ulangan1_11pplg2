import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/data/db_helper.dart';
import 'package:ulangan1_11pplg2/pages/AddTaskListPage/add_task_dialog.dart';

class TaskMenuController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  String currentRoute = Get.currentRoute;

  void onTapItem(String value, int index, bool isCompleted) async {
    final todoItem = dataTodo.toDoItem[index];
    switch (value) {
      case 'completed': 
        dataTodo.toDoItem[index].isCompleted = !isCompleted;
        dataTodo.toDoItem.refresh();
        print(currentRoute);
        break;
      case 'edit':
        Get.dialog(AddTaskDialog(editIndex: index));
        break;
      case 'restore':
        dataTodo.toDoItem[index].isCompleted = false;
        dataTodo.toDoItem.refresh();

        await DbHelper().updateIsCompleted(todoItem.id!, 0);

        print(currentRoute);
        break;
      case 'delete':
        dataTodo.toDoItem.removeAt(index);
        await DbHelper().deleteById(todoItem.id!);
        break;
    }
  }

  String getMenuText(bool isCompleted) {
    return isCompleted ? 'Restore' : 'Completed';
  }
}
