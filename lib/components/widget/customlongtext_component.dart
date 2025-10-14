import 'package:flutter/material.dart';

class CustomLongText extends StatelessWidget {
  final String text;
  final double size;
  // final double padding;
  final Color color;
  final FontWeight weight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double maxLines;

  const CustomLongText({
    super.key,
    required this.text,
    required this.color,
    required this.weight,
    this.fontFamily,
    required this.size,
    this.textAlign = TextAlign.start,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: fontFamily,
        fontWeight: weight,
      ),
    );
  }
}
