import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/bindings/splash_binding.dart';
import 'package:ulangan1_11pplg2/routes/app_pages.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.navbarPage,
      getPages: AppPages.appPages,
    );
  }
}
