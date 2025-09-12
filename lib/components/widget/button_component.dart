import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double? height;
  final double? width;
  final double size;
  final double borderRadius;
  final Color color;
  final Color? iconColor;
  final String text;
  final VoidCallback onPressed;
  final FontWeight weight;
  final IconData? icon;

  final bool? initialValue;

  ButtonComponent({
    super.key,
    this.height,
    this.width,
    required this.color,
    required this.text,
    this.weight = FontWeight.w500,
    this.borderRadius = 8,
    required this.onPressed,
    this.size = 18,
    this.icon,
    this.iconColor,
    this.initialValue,
  }) {
    if (initialValue != null) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    return SizedBox(
      width: width,
      height: height,
      child: (icon == null)
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: shape,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: size,
                  color: Colors.white,
                  fontWeight: weight,
                ),
              ),
            )
          : ElevatedButton.icon(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: shape,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
              ),
              icon: Icon(icon, color: iconColor ?? Colors.white, size: 20),
              label: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size,
                  fontWeight: weight,
                ),
              ),
            ),
    );
  }
}
