import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';

class ProfileController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();

  Rx<DateTime> dateNow = DateTime.now().obs;
  RxBool complete = false.obs;
  RxBool completed = true.obs;

  int get totalTasks {
    return dataTodo.toDoItem
        .where((item) => item.isCompleted == complete.value)
        .length;
  }

  int get todayTasks {
    return dataTodo.toDoItem
        .where(
          (item) =>
              item.date.year == dateNow.value.year &&
              item.date.month == dateNow.value.month &&
              item.date.day == dateNow.value.day &&
              item.isCompleted == complete.value,
        )
        .length;
  }

  int get completedTasks {
    return dataTodo.toDoItem
        .where((item) => item.isCompleted == completed.value)
        .length;
  }
}
