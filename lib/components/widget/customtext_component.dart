import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  // final double padding;
  final Color color;
  final FontWeight weight;
  final String? fontFamily;

  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.weight,
    // required this.padding,
    this.fontFamily,
    required this.size,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size, 
        color: color, 
        fontFamily: fontFamily, 
        fontWeight: weight,),
    );
  }
}