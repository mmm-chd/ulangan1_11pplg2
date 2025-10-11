import 'package:flutter/widgets.dart';

class ToDoItem {
  final int? id;
  final String title;
  final String desc;
  final DateTime date;
  final String startTime;
  final String endTime;
  final Color priority;
  final String priorityStr;
  bool isCompleted;

  ToDoItem({
    this.id,
    required this.title,
    required this.desc,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.priority,
    required this.priorityStr,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'desc': desc,
    'date': date.toIso8601String(),
    'startTime': startTime,
    'endTime': endTime,
    'priority': priority.value,
    'priorityStr': priorityStr,
    'isCompleted': isCompleted ? 1 : 0,
  };

  factory ToDoItem.fromMap(Map<String, dynamic> map) => ToDoItem(
    id: map['id'] as int?,
    title: map['title'] as String,
    desc: map['desc'] as String? ?? '',
    date: DateTime.parse(map['date'] as String),
    startTime: map['startTime'] as String,
    endTime: map['endTime'] as String,
    priority: Color(map['priority'] as int),
    priorityStr: map['priorityStr'] as String,
    isCompleted: (map['isCompleted'] as int) == 1,
  );
}
