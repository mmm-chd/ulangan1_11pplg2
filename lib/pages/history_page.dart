import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Row(
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
      ),
    );
  }
}
