import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview_component/cardview_mobile.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/history_controller.dart';

class HistoryPageMobile extends StatelessWidget {
  HistoryPageMobile({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                  text: "Completed",
                  color: MainColor.primaryColor,
                  weight: FontWeight.bold,
                  size: 36,
                ),
                PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_vert,
                    size: 24,
                    color: MainColor.primaryColor,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        historyController.deleteAll();
                      },
                      value: 'delete all',
                      child: Text('Delete All'),
                    ),
                  ],
                ),
              ],
            ),
            const SpacingComponent(height: 16),

            Expanded(
              child: Obx(() {
                final completedList = historyController.completedList;

                if (completedList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animation/ghost.json',
                          width: 200,
                          height: 200,
                          frameRate: FrameRate(30),
                          backgroundLoading: true,
                          filterQuality: FilterQuality.low,
                        ),
                        const SpacingComponent(height: 16),
                        Text(
                          'Finish Your Task',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SpacingComponent(height: 16),
                        Text(
                          'Make it completed, so your task will be show here',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: completedList.length,
                  itemBuilder: (context, index) {
                    return CardviewMobile(
                      color: completedList[index].priority,
                      title: completedList[index].title,
                      desc: completedList[index].desc,
                      startTime: completedList[index].startTime.toString(),
                      endTime: completedList[index].endTime.toString(),
                      isCompleted: completedList[index].isCompleted,
                      onTapItem: (value) {
                        historyController.onTapMenu(
                          value,
                          index,
                          completedList[index].isCompleted,
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
