class ToDoItem {
  final int id;
  final String title;
  final String desc;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String priority;

  ToDoItem({
    required this.id,
    required this.title,
    required this.desc,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.priority,
  });
}
