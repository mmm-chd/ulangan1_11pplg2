import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';
import 'package:ulangan1_11pplg2/pages/AddTaskListPage/add_task_dialog.dart';

class ListTaskController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  final TaskMenuController taskMenuController = Get.find<TaskMenuController>();

  RxBool complete = false.obs;
  RxBool isTap = false.obs;

  var selectedDate = Rxn<DateTime>(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    // Set initial selected date
    if (selectedDate.value == null) {
      selectedDate.value = DateTime.now();
    }
  }

  void onSelectedDate(DateTime dateTime) {
    selectedDate.value = dateTime;
  }

  List<ToDoItem> get filteredList {
    if (selectedDate.value != null) {
      return dataTodo.toDoItem
          .where(
            (item) =>
                item.date.year == selectedDate.value!.year &&
                item.date.month == selectedDate.value!.month &&
                item.date.day == selectedDate.value!.day &&
                item.isCompleted == complete.value,
          )
          .toList();
    }
    return dataTodo.toDoItem;
  }

  void onTapMenu(String value, int index, bool isCompleted) async {
    final todoItem = filteredList[index];
    final actualIndex = dataTodo.toDoItem.indexOf(todoItem);

    if (actualIndex != -1) {
      if (value == 'edit') {
        await Get.dialog(AddTaskDialog(editIndex: actualIndex));
        update();
        return;
      }

      taskMenuController.onTapItem(value, actualIndex, isCompleted);

      update();
    }
  }

  void onTapAddTask() {
    isTap.value = !isTap.value;
  }
}
