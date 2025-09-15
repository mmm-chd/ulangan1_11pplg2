import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class TaskMenuController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  RxBool complete = true.obs;

  void onTapItem(String value, index) {
    switch (value) {
      case 'completed':
        dataTodo.toDoItem[index].isCompleted =
            !dataTodo.toDoItem[index].isCompleted;
        break;
      case 'edit':
        Get.toNamed('/addTaskPage', arguments: index);
        break;
      case 'delete':
        dataTodo.toDoItem.removeAt(index);
        break;
    }
  }
}
