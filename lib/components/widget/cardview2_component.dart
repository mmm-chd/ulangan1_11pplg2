import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';

class CardTaskComponent extends StatelessWidget {
  final Color color;
  final String title;
  final String desc;
  final String startTime;
  final String endTime;
  final VoidCallback? onTapItem;

  const CardTaskComponent({
    super.key,
    required this.color,
    required this.title,
    required this.desc,
    required this.startTime,
    required this.endTime,
    this.onTapItem,
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
                CustomText(
                  text: title,
                  color: SupportColor.whiteColor,
                  weight: FontWeight.bold,
                  size: 22,
                ),

                SizedBox(height: 6),

                CustomText(
                  text: desc,
                  color: SupportColor.whiteColor,
                  weight: FontWeight.w500,
                  size: 13,
                ),

                SizedBox(height: 6),

                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: SupportColor.whiteColor,
                    ),
                    SizedBox(width: 4),
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
              ],
            ),
          ),
          SizedBox(width: 8),

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
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Completed',
                      onTap: onTapItem,
                      child: Text('Completed'),
                    ),
                    PopupMenuDivider(thickness: 1),
                    PopupMenuItem(
                      value: 'edit',
                      onTap: onTapItem,
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      onTap: onTapItem,
                      child: Text('Delete'),
                    ),
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
