import 'dart:ui';

import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class HomeController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();

  Rx<DateTime> dateNow = DateTime.now().obs;
  Color primaryColor = PriorityColor.primaryColor;
  Color secondaryColor = PriorityColor.secondaryColor;
  Color accentColor = PriorityColor.accentColor;

  List<ToDoItem> get todayList {
    return dataTodo.toDoItem
        .where(
          (item) =>
              item.date.year == dateNow.value.year &&
              item.date.month == dateNow.value.month &&
              item.date.day == dateNow.value.day,
        )
        .toList();
  }

  int get taskQuantMust {
    return dataTodo.toDoItem
        .where((item) => item.priority == primaryColor)
        .length;
  }

  int get taskQuantShould {
    return dataTodo.toDoItem
        .where((item) => item.priority == secondaryColor)
        .length;
  }

  int get taskQuantCould {
    return dataTodo.toDoItem
        .where((item) => item.priority == accentColor)
        .length;
  }
}
