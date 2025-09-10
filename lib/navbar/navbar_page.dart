import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/color.dart';
import 'package:ulangan1_11pplg2/controller/navbar_controller.dart';

class NavbarPage extends StatelessWidget {
  NavbarPage({super.key});

  final NavbarController navbarController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navbarController.pages[navbarController.currentIndex.value],
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 10,
          currentIndex: navbarController.currentIndex.value,
          onTap: (value) => navbarController.changeIndex(value),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home_unfocused.svg',
                width: 28,
                height: 28,
              ),

              activeIcon: SvgPicture.asset(
                'assets/icons/home_focused.svg',
                width: 28,
                height: 28,
              ),

              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/history_unfocused.svg',
                width: 28,
                height: 28,
              ),

              activeIcon: SvgPicture.asset(
                'assets/icons/history_focused.svg',
                width: 28,
                height: 28,
              ),

              label: "History",
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile_unfocused.svg',
                width: 28,
                height: 28,
              ),

              activeIcon: SvgPicture.asset(
                'assets/icons/profile_focused.svg',
                width: 28,
                height: 28,
              ),

              label: "Profile",
            ),
          ],

          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MainColor.primaryColor,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: SupportColor.stroke,
          ),
        ),
      ),
    );
  }
}
