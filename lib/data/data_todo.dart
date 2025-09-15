import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class DataTodo extends GetxController {
  DateFormat dateFormat = DateFormat.yM();
  DateFormat timeFormat = DateFormat();

  RxList<ToDoItem> toDoItem = <ToDoItem>[
    ToDoItem(
      title: 'Belajar Dasar Flutter',
      desc: 'Belajar Component dan layouting Flutter',
      date: DateTime.now(),
      startTime: DateFormat(
        'HH.mm',
      ).format(DateTime.parse('2025-08-12 18:30:00')).toString(),
      endTime: DateFormat('HH.mm')
          .format(DateTime.parse('2025-08-12 18:30:00').add(Duration(hours: 2)))
          .toString(),
      priority: PriorityColor.primaryColor,
      priorityStr: 'must do',
      isCompleted: false,
    ),
    ToDoItem(
      title: 'title',
      desc: 'desc',
      date: DateTime.now(),
      startTime: DateFormat(
        'HH.mm',
      ).format(DateTime.parse('2025-08-12 18:30:00')).toString(),
      endTime: DateFormat('HH.mm')
          .format(DateTime.parse('2025-08-12 18:30:00').add(Duration(hours: 2)))
          .toString(),
      priority: PriorityColor.secondaryColor,
      priorityStr: 'should do',
      isCompleted: false,
    ),
    ToDoItem(
      title: 'title1',
      desc: 'desc',
      date: DateTime.now().add(Duration(days: 1)),
      startTime: DateFormat(
        'HH.mm',
      ).format(DateTime.parse('2025-08-12 18:30:00')).toString(),
      endTime: DateFormat('HH.mm')
          .format(DateTime.parse('2025-08-12 18:30:00').add(Duration(hours: 2)))
          .toString(),
      priority: PriorityColor.accentColor,
      priorityStr: 'could do',
      isCompleted: false,
    ),
  ].obs;
}
