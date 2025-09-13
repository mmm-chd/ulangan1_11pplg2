import 'package:intl/intl.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/model/model.dart';

class DataTodo {
  
  DateFormat dateFormat = DateFormat.yM();
  DateFormat timeFormat = DateFormat();

  var toDoItem = <ToDoItem>[
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
    ),
  ];
}
