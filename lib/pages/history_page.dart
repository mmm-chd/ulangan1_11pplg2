import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview2_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/controller/list_task_controller.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final ListTaskController listTaskController = Get.find<ListTaskController>();

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
        // Expanded(
        //     child: Obx(
        //       () => ListView.builder(
        //         shrinkWrap: true,
        //         itemCount: listTaskController.filteredList.length,
        //         padding: EdgeInsets.only(top: 8, left: 16, right: 16),
        //         itemBuilder: (context, index) {
        //           return CardTaskComponent(
        //             color: listTaskController.filteredList[index].priority,
        //             title: listTaskController.filteredList[index].title,
        //             desc: listTaskController.filteredList[index].desc,
        //             startTime: listTaskController.filteredList[index].startTime
        //                 .toString(),
        //             endTime: listTaskController.filteredList[index].endTime
        //                 .toString(),
        //           );
        //         },
        //       ),
        //     ),
        //   ),
      ],
    ),
  ),
);
  }
}
