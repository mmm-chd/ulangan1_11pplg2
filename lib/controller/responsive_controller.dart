import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController{
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constrains){
    isMobile.value = constrains.maxWidth < 600;
  }

  }