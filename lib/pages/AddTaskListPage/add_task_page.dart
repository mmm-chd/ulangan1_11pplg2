import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/responsive_controller.dart';
import 'package:ulangan1_11pplg2/pages/AddTaskListPage/add_task_page_mobile.dart';
import 'package:ulangan1_11pplg2/pages/AddTaskListPage/add_task_page_widescreen.dart';
import 'package:ulangan1_11pplg2/pages/HomePage/home_page_mobile.dart';
import 'package:ulangan1_11pplg2/pages/HomePage/home_page_widescreen.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          controller.updateLayout(constraints);
          return Obx(
            ()=> controller.isMobile.value ? AddTaskPageMobile() : AddTaskPageWide()
          );
        }
        ),
    );
  }
}