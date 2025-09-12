import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {
  final String hintText;
  final Color outlineColor;
  final double borderRadius;
  final bool obsecureText;
  final IconButton? suffixIcon;
  final TextEditingController? controller;

  const CustomTextField2({
    super.key,
    required this.hintText,
    required this.outlineColor,
    this.borderRadius = 16,
    this.obsecureText = false,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: outlineColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: outlineColor, width: 1.5),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
