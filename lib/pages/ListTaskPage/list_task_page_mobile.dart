import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/button_component.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/easydatetime_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/list_task_controller.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class ListTaskPageMobile extends StatelessWidget {
  ListTaskPageMobile({super.key});

  final ListTaskController listTaskController = Get.find<ListTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MainColor.primaryColor.withOpacity(0.2),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, color: MainColor.primaryColor),
                    splashRadius: 22.5,
                  ),
                ),

                ButtonComponent(
                  iconColor: SupportColor.whiteColor,
                  backgroundColor: MainColor.primaryColor,
                  icon: Icons.add,
                  text: "Add Task",
                  weight: FontWeight.bold,
                  onPressed: () {
                    Get.toNamed(AppRoutes.addtaskPage);
                  },
                  size: 18,
                  borderRadius: 8,
                ),
              ],
            ),
          ),

          SpacingComponent(height: 20),

          DateTimelineComponent(
            initialDate: DateTime.now(),
            onChange: (date) {
              listTaskController.onSelectedDate(date);
            },
          ),

          Expanded(
            child: Obx(() {
              final listTask = listTaskController.filteredList;

              if (listTask.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.task_alt, size: 64, color: Colors.grey[400]),
                      const SpacingComponent(height: 16),

                      CustomText(
                        text: 'No tasks for this date',
                        color: SupportColor.grayColor,
                        weight: FontWeight.w500,
                        size: 18,
                      ),

                      const SpacingComponent(height: 8),

                      CustomText(
                        text: 'Tap "Add Task" to create a new task',
                        color: SupportColor.grayColor,
                        weight: FontWeight.w400,
                        size: 14,
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: listTask.length,
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                itemBuilder: (context, index) {
                  return CardTaskComponent(
                    color: listTask[index].priority,
                    title: listTask[index].title,
                    desc: listTask[index].desc,
                    startTime: listTask[index].startTime.toString(),
                    endTime: listTask[index].endTime,
                    isCompleted: listTask[index].isCompleted,
                    onTapItem: (value) {
                      listTaskController.onTapMenu(
                        value,
                        index,
                        listTask[index].isCompleted,
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
