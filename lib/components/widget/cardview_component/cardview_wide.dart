import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/customlongtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';

class CardviewWide extends StatelessWidget {
  final Color color;
  final String title;
  final String desc;
  final String startTime;
  final String endTime;
  final bool isCompleted;
  final Function(String) onTapItem;

  final TaskMenuController taskMenuController = Get.find<TaskMenuController>();

  CardviewWide({
    super.key,
    required this.color,
    required this.title,
    required this.desc,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: title,
                              color: SupportColor.whiteColor,
                              weight: FontWeight.bold,
                              size: 22,
                            ),

                            SpacingComponent(height: 6),

                            CustomLongText(
                              text: desc,
                              color: SupportColor.whiteColor,
                              weight: FontWeight.w500,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SpacingComponent(height: 6),

                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: SupportColor.whiteColor,
                    ),
                    const SpacingComponent(width: 4),
                    CustomText(
                      text: '$startTime - $endTime',
                      color: SupportColor.whiteColor,
                      weight: FontWeight.normal,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SpacingComponent(width: 8),

          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 20,
              color: SupportColor.whiteColor,
            ),
            onSelected: (value) => onTapItem(value),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'completed',
                child: CustomText(
                  text: '${taskMenuController.getMenuText(isCompleted)}',
                ),
              ),
              PopupMenuDivider(thickness: 1),
              if (isCompleted == false)
                PopupMenuItem(
                  value: 'edit',
                  child: CustomText(text: 'Edit'),
                ),
              PopupMenuItem(
                value: 'delete',
                child: CustomText(text: 'Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
