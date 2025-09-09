import 'package:flutter/material.dart';

class SocialbuttonComponent extends StatelessWidget {
  final String asset;

  const SocialbuttonComponent({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      // backgroundImage: AssetImage(asset),
      child: Image.asset(asset, fit: BoxFit.contain),
      // child: Padding(
      //   padding: const EdgeInsets.all(6.0),
      //   child: Image.asset(asset, fit: BoxFit.contain),
      // ),
    );
  }
}
