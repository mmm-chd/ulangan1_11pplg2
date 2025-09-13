import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/pages/home_page.dart';
import 'package:ulangan1_11pplg2/pages/profile_page.dart';

class NavbarController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [HomePage(), ProfilePage(), ProfilePage()];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
