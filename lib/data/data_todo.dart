import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class DataTodo extends GetxController {
  DateFormat dateFormat = DateFormat.yM();
  DateFormat timeFormat = DateFormat();

  RxList<ToDoItem> toDoItem = <ToDoItem>[].obs;
}
