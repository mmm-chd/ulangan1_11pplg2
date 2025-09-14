import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PriorityList {
  final String priorityText;
  final RxBool priorityBool;
  final Color color;

  PriorityList(this.priorityBool, this.color, {required this.priorityText});
}
