import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
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
                    // ignore: deprecated_member_use
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
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MainColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: SupportColor.whiteColor,
                    size: 24,
                  ),
                  label: const Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
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
            child: Container(
              margin: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Obx(
                () => ListView.builder(
                  itemCount: listTaskController.filteredList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          spacing: 16,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listTaskController.filteredList[index].title,
                                ),
                                Text(
                                  listTaskController.filteredList[index].desc,
                                ),
                                Text(
                                  listTaskController.filteredList[index].date
                                      .toString(),
                                ),
                                Text(
                                  listTaskController
                                      .filteredList[index]
                                      .priority,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
