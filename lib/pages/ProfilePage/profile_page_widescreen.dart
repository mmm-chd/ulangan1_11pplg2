import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/profile_option.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/profile_controller.dart';

class ProfilePageWide extends StatelessWidget {
  ProfilePageWide({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SupportColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Profile",
                color: MainColor.primaryColor,
                weight: FontWeight.bold,
                size: 34,
              ),
              const SpacingComponent(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: SupportColor.stroke),
                            borderRadius: BorderRadius.circular(12),
                            color: SupportColor.whiteColor,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 52,
                                backgroundImage: AssetImage(
                                  'assets/images/profile.jpg',
                                ),
                              ),
                              const SizedBox(width: 24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Matthew",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: TextColor.primaryTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "Matthew@gmail.com",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SpacingComponent(height: 8),
                        Card(
                          color: SupportColor.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: SupportColor.stroke,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: const [
                                ProfileOptionComponent(
                                  title: 'Personal',
                                  icon: Icons.person,
                                ),
                                ProfileOptionComponent(
                                  title: 'General',
                                  icon: Icons.settings,
                                ),
                                ProfileOptionComponent(
                                  title: 'Settings',
                                  icon: Icons.build,
                                ),
                                ProfileOptionComponent(
                                  title: 'Help',
                                  icon: Icons.help,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SpacingComponent(width: 28),

                  //Task
                  Expanded(
                    child: SizedBox(
                      height: 500,
                      child: Card(
                        color: MainColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: SupportColor.stroke),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Obx(
                                  () => Text(
                                    profileController.totalTasks.toString(),
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: SupportColor.whiteColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Tasks',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: SupportColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),

                            const Divider(
                              color: Colors.white70,
                              thickness: 2,
                              indent: 50,
                              endIndent: 50,
                            ),
                            Column(
                              children: [
                                Obx(
                                  () => Text(
                                    profileController.todayTasks.toString(),
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: SupportColor.whiteColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Today Task',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: SupportColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.white70,
                              thickness: 2,
                              indent: 50,
                              endIndent: 50,
                            ),
                            Column(
                              children: [
                                Obx(
                                  () => Text(
                                    profileController.completedTasks.toString(),
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: SupportColor.whiteColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: SupportColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
