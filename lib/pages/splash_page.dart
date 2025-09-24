import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ulangan1_11pplg2/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animation/splash.json',
          width: 200,
          height: 200,
          frameRate: FrameRate(30),
          backgroundLoading: true,
        ),
      ),
    );
  }
}
