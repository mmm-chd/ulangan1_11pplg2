import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/data/db_helper.dart';
import 'package:ulangan1_11pplg2/model/model.dart';
import 'package:ulangan1_11pplg2/model/model_priority.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

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

  DateFormat dateFormat = DateFormat('EEE, MMM d yyyy');
  Rx<DateTime> date = DateTime.now().obs;

  Rx<TimeOfDay> startTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> endTime = TimeOfDay.now().obs;
  TimeOfDay get myStartTime => startTime.value;
  TimeOfDay get myEndTime => endTime.value;

  Color priorityColor = PriorityColor.primaryColor;

  String priorityStr = 'must do';
  String buttonText = 'Add Task';
  String headerText = 'Add Task';

  ValueChanged<bool>? onTap;

  bool get isEditMode => index != null;

  // Database
  final _dbhelper = DbHelper();

  // Fetch Database for Create, edit
  Future<void> fetchData() async {
    await _dbhelper.initDatabase();
    final data = await _dbhelper.getList();
    dataTodo.toDoItem.assignAll(data);
  }

  void fillIn() {
    if (!isEditMode) return;

    final todoItem = dataTodo.toDoItem[index!];
    titleEditingController.text = todoItem.title;
    descEditingController.text = todoItem.desc;
    dateEditingController.text = todoItem.date.toString();
    startTimeEditingController.text = todoItem.startTime;
    endTimeEditingController.text = todoItem.endTime;

    date.value = todoItem.date;

    startTime.value = _parseTimeString(todoItem.startTime);
    endTime.value = _parseTimeString(todoItem.endTime);

    setPriorityFromString(todoItem.priorityStr);
  }

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

  TimeOfDay _parseTimeString(String timeString) {
    final parts = timeString.split('.');
    if (parts.length != 2) {
      return TimeOfDay.now();
    }
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }

  // Helper method to format time as HH.mm
  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}.${time.minute.toString().padLeft(2, '0')}';
  }

  void setPriorityFromString(String priorityStr) {
    resetState();
    switch (priorityStr) {
      case 'must do':
        isMust.value = true;
        priorityColor = PriorityColor.primaryColor;
        this.priorityStr = 'must do';
        break;
      case 'should do':
        isShould.value = true;
        priorityColor = PriorityColor.secondaryColor;
        this.priorityStr = 'should do';
        break;
      case 'could do':
        isCould.value = true;
        priorityColor = PriorityColor.accentColor;
        this.priorityStr = 'could do';
        break;
      default:
        isMust.value = true;
        priorityColor = PriorityColor.primaryColor;
        this.priorityStr = 'must do';
    }
  }

  // Edit Task
  // Edit Task
  void editTask() async {
    if (!validateFields() || !isEditMode) return;

    // Ambil item lama (untuk id dan status isCompleted)
    final oldItem = dataTodo.toDoItem[index!];

    // Buat item baru dengan data hasil edit (sertakan id lama)
    final updatedItem = ToDoItem(
      id: oldItem.id, // penting agar update menyasar row yang benar di DB
      title: titleEditingController.text.trim(),
      desc: descEditingController.text.trim(),
      date: date.value,
      startTime: _formatTime(startTime.value),
      endTime: _formatTime(endTime.value),
      priority: priorityColor,
      priorityStr: priorityStr,
      isCompleted: oldItem.isCompleted,
    );

    // Update ke database
    await _dbhelper.updateTask(updatedItem);

    // Update Task
    dataTodo.toDoItem[index!] = updatedItem;
    dataTodo.toDoItem.refresh(); //RxList ter-trigger

    //reload
    clearControllers();
    await fetchData();

    // Kembali ke halaman utama
    Get.offAllNamed(AppRoutes.navbarPage);
  }

  int get selectedPriorityIndex {
    if (isMust.value) return 0;
    if (isShould.value) return 1;
    if (isCould.value) return 2;
    return 0;
  }

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
    final initialDate = dateEditingController.text.isEmpty
        ? DateTime.now()
        : date.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
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
    final initialTime = isEditMode ? startTime.value : TimeOfDay.now();
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
    return startTimeEditingController.text = _formatTime(myStartTime);
  }

  Future epickerTime(BuildContext context) async {
    final initialTime = isEditMode ? endTime.value : TimeOfDay.now();
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
    return endTimeEditingController.text = _formatTime(myEndTime);
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
    return true;
  }

  // Add Task
  void addTask() async {
    if (!validateFields()) return;

    final String titleTxt = titleEditingController.text.trim();
    final String descTxt = descEditingController.text.trim();
    final String dateTxt = date.value.toIso8601String();
    final String startTimeTxt = _formatTime(startTime.value);
    final String endTimeTextTxt = _formatTime(endTime.value);
    final int priorityCo = priorityColor.value.toInt();
    final String priorityStrg = priorityStr;
    final int isCompleted = 0;

    await _dbhelper.insertList(
      titleTxt,
      descTxt,
      dateTxt,
      startTimeTxt,
      endTimeTextTxt,
      priorityCo,
      priorityStrg,
      isCompleted,
    );

    clearControllers();
    await fetchData();
    Get.offAllNamed('/navbarPage');
  }

  String getButtonText() {
    if (isEditMode) {
      return buttonText = 'Update Task';
    }
    return buttonText;
  }

  String getHeaderText() {
    if (isEditMode) {
      return headerText = 'Update Task';
    }
    return headerText;
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

  void saveTaskFromDialog() async {
  if (isEditMode) {
    await editTaskFromDialog();
  } else {
    await addTaskFromDialog();
  }
}

// Modified editTask for dialog usage
Future<void> editTaskFromDialog() async {
  if (!validateFields() || !isEditMode) return;

  final oldItem = dataTodo.toDoItem[index!];

  final updatedItem = ToDoItem(
    id: oldItem.id,
    title: titleEditingController.text.trim(),
    desc: descEditingController.text.trim(),
    date: date.value,
    startTime: _formatTime(startTime.value),
    endTime: _formatTime(endTime.value),
    priority: priorityColor,
    priorityStr: priorityStr,
    isCompleted: oldItem.isCompleted,
  );

  await _dbhelper.updateTask(updatedItem);
  dataTodo.toDoItem[index!] = updatedItem;
  dataTodo.toDoItem.refresh();

  clearControllers();
  await fetchData();
  
  Get.back();
  
  Get.snackbar(
    'Success',
    'Task updated successfully',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}

Future<void> addTaskFromDialog() async {
  if (!validateFields()) return;

  final String titleTxt = titleEditingController.text.trim();
  final String descTxt = descEditingController.text.trim();
  final String dateTxt = date.value.toIso8601String();
  final String startTimeTxt = _formatTime(startTime.value);
  final String endTimeTextTxt = _formatTime(endTime.value);
  final int priorityCo = priorityColor.value.toInt();
  final String priorityStrg = priorityStr;
  final int isCompleted = 0;

  await _dbhelper.insertList(
    titleTxt,
    descTxt,
    dateTxt,
    startTimeTxt,
    endTimeTextTxt,
    priorityCo,
    priorityStrg,
    isCompleted,
  );

  clearControllers();
  await fetchData();
  
  Get.back(); // Close dialog instead of navigating
  
  Get.snackbar(
    'Success',
    'Task added successfully',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}
}
