import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  DateFormat dateFormat = DateFormat('EEE, MMM d, yyyy');
  Rx<DateTime> date = DateTime.now().obs;

  Rx<TimeOfDay> startTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> endTime = TimeOfDay.now().obs;
  TimeOfDay get myStartTime => startTime.value;
  TimeOfDay get myEndTime => endTime.value;
  DateFormat timeFormat = DateFormat('HH.mm');

  Color priorityColor = PriorityColor.primaryColor;

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
    bool isCurrentlySelected = false;
    switch (index) {
      case 0:
        isCurrentlySelected = isMust.value;
        break;
      case 1:
        isCurrentlySelected = isShould.value;
        break;
      case 2:
        isCurrentlySelected = isCould.value;
        break;
    }

    // If already selected, do nothing (keep it selected - can't deselect)
    if (isCurrentlySelected) {
      return;
    }

    // Reset all and select the new one
    resetState();
    switch (index) {
      case 0:
        isMust.value = true;
        priorityColor = PriorityColor.primaryColor;
        break;
      case 1:
        isShould.value = true;
        priorityColor = PriorityColor.secondaryColor;
        break;
      case 2:
        isCould.value = true;
        priorityColor = PriorityColor.accentColor;
        break;
    }

    if (onTap != null) {
      onTap!(true);
    }
  }

  Future pickerDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
      confirmText: "Set",
    );

    if (newDate == null) return;

    date.value = newDate;
    dueDate();
  }

  String dueDate() {
    return dateEditingController.text = dateFormat.format(date.value);
  }

  Future spickerTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      confirmText: "Set",
    );

    if (newTime == null) return;

    startTime.value = newTime;
    sTimer();
  }

  String sTimer() {
    final now = DateTime.now();
    return startTimeEditingController.text = timeFormat.format(
      DateTime(
        now.year,
        now.month,
        now.day,
        myStartTime.hour,
        myStartTime.minute,
      ),
    );
  }

  Future epickerTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      confirmText: "Set",
    );

    if (newTime == null) return;

    endTime.value = newTime;
    eTimer();
  }

  String eTimer() {
    final now = DateTime.now();
    return endTimeEditingController.text = timeFormat.format(
      DateTime(now.year, now.month, now.day, myEndTime.hour, myEndTime.minute),
    );
  }

  bool validateFields() {
    if (titleEditingController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Title is required');
      return false;
    } else if (dateEditingController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Date is required');
      return false;
    } else if (startTimeEditingController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Start time is required');
      return false;
    } else if (endTimeEditingController.text.trim().isEmpty) {
      Get.snackbar('Error', 'End time is required');
      return false;
    } else {
      return true;
    }
  }

  void addTask() {
    if (!validateFields()) return;

    dataTodo.toDoItem.add(
      ToDoItem(
        title: titleEditingController.text.trim(),
        desc: descEditingController.text.trim(),
        date: date.value,
        startTime: startTimeEditingController.text.trim(),
        endTime: endTimeEditingController.text.trim(),
        priority: priorityColor,
      ),
    );
    clearControllers();
    Get.offNamed('/navbarPage');
  }

  void clearControllers() {
    titleEditingController.clear();
    descEditingController.clear();
    dateEditingController.clear();
    startTimeEditingController.clear();
    endTimeEditingController.clear();

    // Reset to default values
    date.value = DateTime.now();
    startTime.value = TimeOfDay.now();
    endTime.value = TimeOfDay.now();
    isMust.value = true;
    isShould.value = false;
    isCould.value = false;
    priorityColor = PriorityColor.primaryColor;
  }
}
