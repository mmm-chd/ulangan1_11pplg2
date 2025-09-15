import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';
import 'package:ulangan1_11pplg2/model/model_priority.dart';

class AddEditTaskController extends GetxController {
  late DataTodo dataTodo;

  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController startTimeEditingController = TextEditingController();
  TextEditingController endTimeEditingController = TextEditingController();

  int? index;

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

  String priorityStr = 'must do';
  String buttonText = 'Add Task';

  ValueChanged<bool>? onTap;

  bool get isEditMode => index != null;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is int) {
      index = arguments;
      dataTodo = Get.find<DataTodo>();
      fillIn();
    } else {
      dataTodo = Get.find<DataTodo>();
      priorityStr = 'must do';
    }
  }

  void fillIn() {
    if (!isEditMode) return;

    final todoItem = dataTodo.toDoItem[index!];
    titleEditingController.text = todoItem.title;
    descEditingController.text = todoItem.desc;
    dateEditingController.text = todoItem.date.toString();
    startTimeEditingController.text = todoItem.startTime;
    endTimeEditingController.text = todoItem.endTime;

    // Set the date value for the date picker
    date.value = todoItem.date;

    // Set priority based on existing item
    setPriorityFromString(todoItem.priorityStr);
  }

  void setPriorityFromString(String priorityStr) {
    resetState();
    switch (priorityStr) {
      case 'must do':
        isMust.value = true;
        priorityColor = PriorityColor.primaryColor;
        priorityStr = 'must do';
        break;
      case 'should do':
        isShould.value = true;
        priorityColor = PriorityColor.secondaryColor;
        priorityStr = 'should do';
        break;
      case 'could do':
        isCould.value = true;
        priorityColor = PriorityColor.accentColor;
        priorityStr = 'could do';
        break;
      default:
        isMust.value = true;
        priorityColor = PriorityColor.primaryColor;
        priorityStr = 'must do';
    }
  }

  void editTask() {
    if (!validateFields() || !isEditMode) return;

    // Update the existing item
    dataTodo.toDoItem[index!] = ToDoItem(
      title: titleEditingController.text.trim(),
      desc: descEditingController.text.trim(),
      date: date.value,
      startTime: startTimeEditingController.text.trim(),
      endTime: endTimeEditingController.text.trim(),
      priority: priorityColor,
      priorityStr: priorityStr,
      isCompleted: false,
    );

    clearControllers();
    Get.back(); // Go back instead of going to navbar page
  }

  int get selectedPriorityIndex {
    if (isMust.value) return 0;
    if (isShould.value) return 1;
    if (isCould.value) return 2;
    return 0; // Default to Must Do
  }

  // Check if a specific priority index is selected
  bool isPrioritySelected(int index) {
    switch (index) {
      case 0:
        return isMust.value;
      case 1:
        return isShould.value;
      case 2:
        return isCould.value;
      default:
        return false;
    }
  }

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

    if (isCurrentlySelected) {
      return;
    }

    resetState();
    switch (index) {
      case 0:
        isMust.value = true;
        priorityColor = listPriority[index].color;
        priorityStr = listPriority[index].priorityText;
        break;
      case 1:
        isShould.value = true;
        priorityColor = listPriority[index].color;
        priorityStr = listPriority[index].priorityText;
        break;
      case 2:
        isCould.value = true;
        priorityColor = listPriority[index].color;
        priorityStr = listPriority[index].priorityText;
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
    }

    if (_isEndTimeBeforeStartTime()) {
      Get.snackbar('Error', 'End time must be after start time');
      return false;
    }

    return true;
  }

  bool _isEndTimeBeforeStartTime() {
    final startMinutes = myStartTime.hour * 60 + myStartTime.minute;
    final endMinutes = myEndTime.hour * 60 + myEndTime.minute;
    return endMinutes <= startMinutes;
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
        priorityStr: priorityStr,
        isCompleted: false,
      ),
    );
    clearControllers();
    Get.offNamed('/navbarPage');
  }

  String getButtonText() {
    if (isEditMode) {
      return buttonText = 'Update Task';
    }
    return buttonText;
  }

  void saveTask() {
    if (isEditMode) {
      editTask();
    } else {
      addTask();
    }
  }

  void clearControllers() {
    titleEditingController.clear();
    descEditingController.clear();
    dateEditingController.clear();
    startTimeEditingController.clear();
    endTimeEditingController.clear();

    date.value = DateTime.now();
    startTime.value = TimeOfDay.now();
    endTime.value = TimeOfDay.now();
    isMust.value = true;
    isShould.value = false;
    isCould.value = false;
    priorityColor = PriorityColor.primaryColor;
    priorityStr = 'must do';
  }
}
