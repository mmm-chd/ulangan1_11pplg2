import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview2_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: "Completed",
                  color: MainColor.primaryColor,
                  weight: FontWeight.bold,
                  size: 36,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.more_vert,
                    color: MainColor.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: historyController.completedList.length,
                  itemBuilder: (context, index) {
                    return CardTaskComponent(
                      color: historyController.completedList[index].priority,
                      title: historyController.completedList[index].title,
                      desc: historyController.completedList[index].desc,
                      startTime: historyController
                          .completedList[index]
                          .startTime
                          .toString(),
                      endTime: historyController.completedList[index].endTime
                          .toString(),
                      isCompleted:
                          historyController.completedList[index].isCompleted,
                      onTapItem: (value) {
                        historyController.onTapMenu(
                          value,
                          index,
                          historyController.completedList[index].isCompleted,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
