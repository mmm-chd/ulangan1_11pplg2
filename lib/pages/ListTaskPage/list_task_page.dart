import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/responsive_controller.dart';
import 'package:ulangan1_11pplg2/pages/ListTaskPage/list_task_page_mobile.dart';
import 'package:ulangan1_11pplg2/pages/ListTaskPage/list_task_page_widescreen.dart';

class ListTaskPage extends StatelessWidget {
  ListTaskPage({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          controller.updateLayout(constraints);
          return Obx(
            ()=> controller.isMobile.value ? ListTaskPageMobile() : ListTaskPageWide()
          );
        }
        ),
    );
  }
} 