import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
