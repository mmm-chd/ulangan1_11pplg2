import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';

class ProfileOptionComponent extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileOptionComponent({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: TextColor.primaryTextColor),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: TextColor.primaryTextColor),
    );
  }
}
