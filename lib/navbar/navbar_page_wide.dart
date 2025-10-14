import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/navbar/navbar_controller.dart';

class NavbarPageWide extends StatelessWidget {
  NavbarPageWide({super.key});

  final NavbarController navbarController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 120,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Orvo',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: MainColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 40),

                // Menu Items
                Obx(() => buildMenuItem(
                      index: 0,
                      label: 'Home',
                      unfocusedIcon: 'assets/icons/home_unfocused.svg',
                      focusedIcon: 'assets/icons/home_focused.svg',
                    )),
                const SizedBox(height: 20),
                Obx(() => buildMenuItem(
                      index: 1,
                      label: 'History',
                      unfocusedIcon: 'assets/icons/history_unfocused.svg',
                      focusedIcon: 'assets/icons/history_focused.svg',
                    )),
                const SizedBox(height: 20),
                Obx(() => buildMenuItem(
                      index: 2,
                      label: 'Profile',
                      unfocusedIcon: 'assets/icons/profile_unfocused.svg',
                      focusedIcon: 'assets/icons/profile_focused.svg',
                    )),
              ],
            ),
          ),

          // Halaman konten di kanan sidebar
          Expanded(
            child: Obx(() => navbarController.pages[navbarController.currentIndex.value]),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required int index,
    required String label,
    required String unfocusedIcon,
    required String focusedIcon,
  }) {
    bool isActive = navbarController.currentIndex.value == index;
    return InkWell(
      onTap: () => navbarController.changeIndex(index),
      child: Column(
        children: [
          SvgPicture.asset(
            isActive ? focusedIcon : unfocusedIcon,
            width: 28,
            height: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? MainColor.primaryColor : SupportColor.stroke,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
