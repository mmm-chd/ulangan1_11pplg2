
import 'package:flutter/widgets.dart';

class ToDoItem {
  final String title;
  final String desc;
  final DateTime date;
  final String startTime;
  final String endTime;
  final Color priority;

  ToDoItem({
    required this.title,
    required this.desc,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.priority,
  });
}
