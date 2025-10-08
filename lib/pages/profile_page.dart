import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/button_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/profile_option.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/auth_controller.dart';
import 'package:ulangan1_11pplg2/controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "Profile",
                color: MainColor.primaryColor,
                weight: FontWeight.bold,
                size: 40,
              ),
              const SpacingComponent(height: 16),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SpacingComponent(height: 16),
              Text(
                "Matthew",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: TextColor.primaryTextColor,
                ),
              ),
              const SpacingComponent(height: 8),
              Text(
                "Matthew@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SpacingComponent(height: 20),

              SizedBox(
                width: 320,
                child: Card(
                  color: MainColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: SupportColor.stroke, width: 1),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  profileController.totalTasks.toString(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: SupportColor.whiteColor,
                                  ),
                                ),
                              ),
                              Text(
                                'Tasks',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: SupportColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 1.5,
                          height: 50,
                          color: SupportColor.whiteColor,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  profileController.todayTasks.toString(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: SupportColor.whiteColor,
                                  ),
                                ),
                              ),
                              Text(
                                'Today Task',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: SupportColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 1.5,
                          height: 50,
                          color: SupportColor.whiteColor,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  profileController.completedTasks.toString(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: SupportColor.whiteColor,
                                  ),
                                ),
                              ),
                              Text(
                                'Completed',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: SupportColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SpacingComponent(height: 32),

              Card(
                color: SupportColor.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: SupportColor.stroke, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Column(
                    children: [
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
                      ProfileOptionComponent(title: 'Help', icon: Icons.help),
                    ],
                  ),
                ),
              ),

              SpacingComponent(height: 20),

              SizedBox(
                width: double.infinity,
                child: ButtonComponent(
                  height: 53,
                  width: 376,
                  backgroundColor: MainColor.primaryColor,
                  text: "Sign Out",
                  size: 24,
                  weight: FontWeight.bold,
                  onPressed: () {
                    authController.signOut();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
