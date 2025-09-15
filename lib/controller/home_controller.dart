import 'dart:ui';

import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class HomeController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();
  final TaskMenuController taskMenuController = Get.find<TaskMenuController>();

  Rx<DateTime> dateNow = DateTime.now().obs;
  Color primaryColor = PriorityColor.primaryColor;
  Color secondaryColor = PriorityColor.secondaryColor;
  Color accentColor = PriorityColor.accentColor;

  RxBool complete = false.obs;

  List<ToDoItem> get todayList {
    return dataTodo.toDoItem
        .where(
          (item) =>
              item.date.year == dateNow.value.year &&
              item.date.month == dateNow.value.month &&
              item.date.day == dateNow.value.day &&
              item.isCompleted == complete.value,
        )
        .toList();
  }

  int get totalTasks {
    return dataTodo.toDoItem
        .where((item) => item.isCompleted == complete.value)
        .length;
  }

  int get taskQuantMust {
    return dataTodo.toDoItem
        .where(
          (item) =>
              item.priority == primaryColor &&
              item.isCompleted == complete.value,
        )
        .length;
  }

  int get taskQuantShould {
    return dataTodo.toDoItem
        .where(
          (item) =>
              item.priority == secondaryColor &&
              item.isCompleted == complete.value,
        )
        .length;
  }

  int get taskQuantCould {
    return dataTodo.toDoItem
        .where(
          (item) =>
              item.priority == accentColor &&
              item.isCompleted == complete.value,
        )
        .length;
  }

  void onTapMenu(String value, int index, bool isCompleted) {
    final todoItem = todayList[index];
    final actualIndex = dataTodo.toDoItem.indexOf(todoItem);

    if (actualIndex != -1) {
      taskMenuController.onTapItem(value, actualIndex, isCompleted);
    }
  }
}
