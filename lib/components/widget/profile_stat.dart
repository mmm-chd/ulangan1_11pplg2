import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';

class ProfileStatComponent extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProfileStatComponent({
    super.key,
    required this.title,
    required this.subtitle
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: SupportColor.whiteColor
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16, 
            color: SupportColor.whiteColor),
        )
      ],
    );
  }
}