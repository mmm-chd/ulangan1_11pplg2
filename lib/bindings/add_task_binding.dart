import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/add_edit_task_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditTaskController>(() => AddEditTaskController());
    Get.lazyPut<DataTodo>(() => DataTodo());

  }
}
