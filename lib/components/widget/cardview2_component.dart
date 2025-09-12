import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';

class CardTaskComponent extends StatelessWidget {
  final Color color;
  final String title;
  final String desc;

  const CardTaskComponent({
    super.key,
    required this.color,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 117,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
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

              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle, // bikin sejajar
                      child: Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "18.30 - 20.30",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 20),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.more_vert,
                size: 20,
                color: SupportColor.whiteColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
