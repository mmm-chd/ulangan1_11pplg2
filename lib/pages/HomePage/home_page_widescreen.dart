import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview_component.dart';
import 'package:ulangan1_11pplg2/components/widget/custom_richtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/searchbar_component.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview2_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/home_controller.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class HomePageWide extends StatelessWidget {
  HomePageWide({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header
            CustomRichText(
              children: [
                TextSpan(
                  text: "Hello, ",
                  style: TextStyle(
                    color: TextColor.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                TextSpan(
                  text: "Matthew !",
                  style: TextStyle(
                    color: MainColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            SpacingComponent(height: 4,),

            //Subtext
            Obx(() {
              if (homeController.totalTasks == 0) {
                return Text(
                  "It's like you don't have any tasks.",
                  style: TextStyle(
                    color: TextColor.primaryTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                );
              } else {
                return CustomRichText(
                  children: [
                    TextSpan(
                      text: "You have ",
                      style: TextStyle(
                        color: TextColor.primaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text:
                          "${homeController.totalTasks} tasks to complete this month.",
                      style: TextStyle(
                        color: MainColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                );
              }
            }),

            SpacingComponent(height: 20),

            const CustomSearchBar(width: double.infinity),
            SpacingComponent(height: 24,),

            //Categories
            CustomText(
              text: "Categories",
              color: TextColor.primaryTextColor,
              weight: FontWeight.w700,
              size: 22,
            ),
            SpacingComponent(height: 20,),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CardviewComponent(
                      color: PriorityColor.primaryColor,
                      color2: SupportColor.mustdopb,
                      task: "${homeController.taskQuantMust} Task",
                      title: "Must Do",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CardviewComponent(
                      color: PriorityColor.secondaryColor,
                      color2: SupportColor.shoulddopb,
                      task: "${homeController.taskQuantShould} Task",
                      title: "Should Do",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CardviewComponent(
                      color: PriorityColor.accentColor,
                      color2: SupportColor.coulddopb,
                      task: "${homeController.taskQuantCould} Task",
                      title: "Could Do",
                    ),
                  ),
                ],
              ),
            ),

            SpacingComponent(height: 36,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Today's Task",
                  color: TextColor.primaryTextColor,
                  weight: FontWeight.w700,
                  size: 22,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.listtaskPage);
                  },
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: SupportColor.grayColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SpacingComponent(height: 20,),

            Obx(() {
              final todayList = homeController.todayList;
              if (todayList.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.task_alt, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No tasks for today',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return GridView.builder(
                itemCount: todayList.length,
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  final task = todayList[index];
                  return CardTaskComponent(
                    color: task.priority,
                    title: task.title,
                    desc: task.desc,
                    startTime: task.startTime.toString(),
                    endTime: task.endTime.toString(),
                    isCompleted: task.isCompleted,
                    onTapItem: (value) {
                      homeController.onTapMenu(
                        value,
                        index,
                        task.isCompleted,
                      );
                    },
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
