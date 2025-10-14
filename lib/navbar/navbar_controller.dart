import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan1_11pplg2/pages/HistoryPage/history_page.dart';
import 'package:ulangan1_11pplg2/pages/HomePage/home_page.dart';
import 'package:ulangan1_11pplg2/pages/ProfilePage/profile_page.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class NavbarController extends GetxController {
  var currentIndex = 0.obs;
  RxBool isActive = false.obs;

  final List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage()];

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
    Get.offAllNamed(AppRoutes.splashPage);
  }
}
