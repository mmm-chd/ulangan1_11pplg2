import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color outlineColor;
  final IconData icon;
  final bool obsecureText;
  final bool showToggle;
  final TextEditingController? controller;
  final VoidCallback? onClick;
  // final RxBool? toggleState;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.outlineColor,
    required this.icon,
    this.obsecureText = false,
    this.showToggle = false,
    this.controller,
    this.onClick,
    // this.toggleState,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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

        suffixIcon: showToggle
            ? IconButton(
                icon: Icon(
                  obsecureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onClick,
              )
            : null,
      ),
    );
  }
}
