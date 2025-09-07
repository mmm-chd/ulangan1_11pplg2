import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  final double borderRadius;
  final Color color;
  final String text;
  final VoidCallback onPressed;
  final FontWeight weight;

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
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed, 
        child: Text(
          text,
          style: TextStyle(fontSize: size, color: Colors.white),
        ),
      ),
    );
  }
}