import 'package:flutter/material.dart';

class SocialbuttonComponent extends StatelessWidget {
  final String asset;

  const SocialbuttonComponent({
    super.key,
    required this.asset,
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {},
          child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(asset),
          ),
        );
  }
}