import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Color color;
  final IconData icon;
  final bool obsecureText;
  final bool showToggle;
  // final RxBool? toggleState;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.color,
    required this.icon,
    this.obsecureText = false,
    this.showToggle = false,
    // this.toggleState,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: color),
        ),

        suffixIcon: showToggle
            ? IconButton(
                icon: Icon(
                  obsecureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {},
              )
            : null,
      ),
    );
  }
}
