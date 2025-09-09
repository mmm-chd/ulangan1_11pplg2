import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color outlineColor;
  final IconData icon;
  final bool obsecureText;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  // final RxBool? toggleState;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.outlineColor,
    required this.icon,
    this.obsecureText = false,
    this.controller,
    this.suffixIcon,
    // this.toggleState,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: outlineColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: outlineColor),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
