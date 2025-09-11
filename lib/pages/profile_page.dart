import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/profile_option.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: "Profile",
              color: MainColor.primaryColor,
              weight: FontWeight.bold,
              size: 40,
            ),
            SizedBox(height: 16),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              "Matthew",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: TextColor.primaryTextColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Matthew@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            Container(
              width: 320,
              child: Card(
                color:
                    MainColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: SupportColor.stroke,
                    width: 1,
                  ),
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
                            Text(
                              '59',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: SupportColor.whiteColor,
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
                        width: 1.5,
                        height: 50,
                        color: SupportColor.whiteColor,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '8',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: SupportColor.whiteColor,
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
                        width: 1.5,
                        height: 50,
                        color: SupportColor.whiteColor,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '28',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: SupportColor.whiteColor,
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

            SizedBox(height: 32),

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
          ],
        ),
      ),
    );
  }
}
