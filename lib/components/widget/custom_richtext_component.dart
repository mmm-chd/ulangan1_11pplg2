import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final List<InlineSpan> children;
  final TextAlign textAlign;

  const CustomRichText({
    super.key,
    required this.children,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: children,
      ),
    );
  }
}
