import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class TaskMenuController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  String currentRoute = Get.currentRoute;

  void onTapItem(String value, int index, bool isCompleted) {
    switch (value) {
      case 'completed':
        dataTodo.toDoItem[index].isCompleted = !isCompleted;
        dataTodo.toDoItem.refresh();
        print(currentRoute);
        break;
      case 'edit':
        Get.toNamed('/addTaskPage', arguments: index);
        break;
      case 'delete':
        dataTodo.toDoItem.removeAt(index);
        break;
    }
  }

  String getMenuText(bool isCompleted) {
    return isCompleted ? 'Restore' : 'Completed';
  }
}
