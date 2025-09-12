import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  final double borderRadius;
  final Color color;
  final Color iconColor;
  final String text;
  final VoidCallback onPressed;
  final FontWeight weight;
  final IconData? icon;

  const ButtonComponent({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.text,
    required this.weight,
    this.borderRadius = 15,
    required this.onPressed,
    required this.size,
    this.icon,
    required this.iconColor,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: icon ==null

      ?  ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed, 
        child: Text(
          text,
          style: TextStyle(fontSize: size, color: Colors.white, fontWeight: weight,),
        ),
      )

      : ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: iconColor,
                    size: 24,
                  ),
                  label: const Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
    );
  }
}