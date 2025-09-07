import 'package:flutter/material.dart';

class SpacingComponent extends StatelessWidget {
  final double height;

  const SpacingComponent({
    super.key, 
    required this.height,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}