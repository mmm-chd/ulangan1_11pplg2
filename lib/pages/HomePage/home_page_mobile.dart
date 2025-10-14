import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview_component.dart';
import 'package:ulangan1_11pplg2/components/widget/card_category_component.dart';
import 'package:ulangan1_11pplg2/components/widget/custom_richtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/searchbar_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/home_controller.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class HomePageMobile extends StatelessWidget {
  HomePageMobile({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpacingComponent(height: 60),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    children: [
                      TextSpan(
                        text: "Hello, ",
                        style: TextStyle(
                          color: TextColor.primaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      TextSpan(
                        text: "Matthew !",
                        style: TextStyle(
                          color: MainColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),

                  SpacingComponent(height: 4),

                  Obx(
                    () => CustomRichText(
                      children: (homeController.totalTasks == 0)
                          ? [
                              TextSpan(
                                text: "It's like you don't have any tasks",
                                style: TextStyle(
                                  color: TextColor.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ]
                          : [
                              TextSpan(
                                text: "You Have ",
                                style: TextStyle(
                                  color: TextColor.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "${homeController.totalTasks} tasks ",
                                style: TextStyle(
                                  color: MainColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "to complete\n",
                                style: TextStyle(
                                  color: TextColor.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "this year.",
                                style: TextStyle(
                                  color: TextColor.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                    ),
                  ),

                  SpacingComponent(height: 16),

                  CustomSearchBar(width: double.infinity,),
                  SpacingComponent(height: 20),

                  CustomText(
                    text: "Categories",
                    color: TextColor.primaryTextColor,
                    weight: FontWeight.w700,
                    size: 20,
                  ),
                ],
              ),
            ),

            SpacingComponent(height: 12),

            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Obx(
                    () => CardviewComponent(
                      color: PriorityColor.primaryColor,
                      color2: SupportColor.mustdopb,
                      task: "${homeController.taskQuantMust.toString()} Tasks",
                      title: "Must Do",
                    ),
                  ),

                  SpacingComponent(width: 12),

                  Obx(
                    () => CardviewComponent(
                      color: PriorityColor.secondaryColor,
                      color2: SupportColor.shoulddopb,
                      task:
                          "${homeController.taskQuantShould.toString()} Tasks",
                      title: "Should Do",
                    ),
                  ),

                  SpacingComponent(width: 12),

                  Obx(
                    () => CardviewComponent(
                      color: PriorityColor.accentColor,
                      color2: SupportColor.coulddopb,
                      task: "${homeController.taskQuantCould.toString()} Tasks",
                      title: "Could Do",
                    ),
                  ),

                  SpacingComponent(width: 12),
                ],
              ),
            ),

            SpacingComponent(height: 32),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Today's Tasks",
                        color: TextColor.primaryTextColor,
                        weight: FontWeight.w700,
                        size: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.listtaskPage);
                        },
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CustomText(
                            text: "Details",
                            color: SupportColor.grayColor,
                            weight: FontWeight.w500,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Obx(() {
                    final todayList = homeController.todayList;

                    if (todayList.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.task_alt,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              SpacingComponent(height: 16),
                              Text(
                                'No tasks for today',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SpacingComponent(height: 8),
                              Text(
                                'Tap "Details" to see and create a new task',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: todayList.length,
                      itemBuilder: (context, index) {
                        return CardTaskComponent(
                          color: todayList[index].priority,
                          title: todayList[index].title,
                          desc: todayList[index].desc,
                          startTime: todayList[index].startTime.toString(),
                          endTime: todayList[index].endTime.toString(),
                          isCompleted: todayList[index].isCompleted,
                          onTapItem: (value) {
                            homeController.onTapMenu(
                              value,
                              index,
                              todayList[index].isCompleted,
                            );
                          },
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
