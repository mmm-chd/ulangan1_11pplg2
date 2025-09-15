import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/button_component.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview2_component.dart';
import 'package:ulangan1_11pplg2/components/widget/easydatetime_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/list_task_controller.dart';

class ListTaskPage extends StatelessWidget {
  ListTaskPage({super.key});

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
                    icon: Icon(Icons.arrow_back),
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
                    Get.toNamed('/addTaskPage');
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
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: listTaskController.filteredList.length,
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                itemBuilder: (context, index) {
                  return CardTaskComponent(
                    color: listTaskController.filteredList[index].priority,
                    title: listTaskController.filteredList[index].title,
                    desc: listTaskController.filteredList[index].desc,
                    startTime: listTaskController.filteredList[index].startTime
                        .toString(),
                    endTime: listTaskController.filteredList[index].endTime,
                    isCompleted:
                        listTaskController.filteredList[index].isCompleted,
                    onTapItem: (value) {
                      listTaskController.onTapMenu(
                        value,
                        index,
                        listTaskController.filteredList[index].isCompleted,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
