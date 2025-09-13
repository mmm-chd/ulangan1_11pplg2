import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';
import 'package:ulangan1_11pplg2/model/model_priority.dart';

class AddEditTaskController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();

  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController startTimeEditingController = TextEditingController();
  TextEditingController endTimeEditingController = TextEditingController();

  RxBool isMust = true.obs;
  RxBool isShould = false.obs;
  RxBool isCould = false.obs;

  Color priorityColor = Colors.transparent;

  ValueChanged<bool>? onTap;

  List<PriorityList> get listPriority => [
    PriorityList(isMust, PriorityColor.primaryColor, priorityText: 'Must Do'),
    PriorityList(
      isShould,
      PriorityColor.secondaryColor,
      priorityText: 'Should Do',
    ),
    PriorityList(isCould, PriorityColor.accentColor, priorityText: 'Could Do'),
  ];

  void resetState() {
    isMust.value = false;
    isShould.value = false;
    isCould.value = false;
  }

  void onHandle(int index) {
    resetState();
    switch (index) {
      case 0:
        isMust.value = !isMust.value;
        break;
      case 1:
        isShould.value = !isShould.value;
        break;
      case 2:
        isCould.value = !isCould.value;
        break;
      default:
    }

    if (onTap != null) {
      switch (index) {
        case 0:
          onTap!(isMust.value);
          priorityColor = listPriority[index].color;
          break;
        case 1:
          onTap!(isShould.value);
          priorityColor = listPriority[index].color;
          break;
        case 2:
          onTap!(isCould.value);
          priorityColor = listPriority[index].color;
          break;
      }
    }
  }

  void addTask() {
    dataTodo.toDoItem.add(
      ToDoItem(
        title: titleEditingController.text,
        desc: descEditingController.text,
        date: DateTime.parse(dateEditingController.text),
        startTime: startTimeEditingController.text,
        endTime: endTimeEditingController.text,
        priority: priorityColor,
      ),
    );
    Get.offNamed('/homePage');
  }
}
