import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/customlongtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';

class CardTaskComponent extends StatelessWidget {
  final Color color;
  final String title;
  final String desc;
  final String startTime;
  final String endTime;
  final bool isCompleted;
  final Function(String) onTapItem;

  final TaskMenuController taskMenuController = Get.find<TaskMenuController>();

  CardTaskComponent({
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
      margin: EdgeInsets.symmetric(vertical: 8),
      width: 345,
      height: 117,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                SpacingComponent(height: 6),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: SupportColor.whiteColor,
                      ),
                      SpacingComponent(width: 4),
                      Text(
                        startTime,
                        style: const TextStyle(
                          color: SupportColor.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        " - ",
                        style: TextStyle(
                          color: SupportColor.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        endTime,
                        style: const TextStyle(
                          color: SupportColor.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SpacingComponent(width: 8),

          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                      child: Text(taskMenuController.getMenuText(isCompleted)),
                    ),
                    PopupMenuDivider(thickness: 1),
                    if (isCompleted == false)
                      PopupMenuItem(value: 'edit', child: Text('Edit')),
                    PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
