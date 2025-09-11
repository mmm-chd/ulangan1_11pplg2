import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class ListTaskController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();

  var selectedDate = Rxn<DateTime>(DateTime.now());

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
                item.date.day == selectedDate.value!.day,
          )
          .toList();
    }
    return dataTodo.toDoItem;
  }
}
