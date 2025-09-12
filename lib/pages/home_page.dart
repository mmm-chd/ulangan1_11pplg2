import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview2_component.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/searchbar_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacingComponent(height: 60),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
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
                ),
                SpacingComponent(height: 4),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "You Have ",
                        style: TextStyle(
                          color: TextColor.primaryTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: "15 tasks ",
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
                        text: "this month.",
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

                CustomSearchBar(),
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
                CardviewComponent(
                  color: PriorityColor.primaryColor,
                  color2: SupportColor.mustdopb,
                  task: "0 Task",
                  title: "Must Do",
                ),

                SizedBox(width: 12),

                CardviewComponent(
                  color: PriorityColor.secondaryColor,
                  color2: SupportColor.shoulddopb,
                  task: "0 Task",
                  title: "Should Do",
                ),

                SizedBox(width: 12),

                CardviewComponent(
                  color: PriorityColor.accentColor,
                  color2: SupportColor.coulddopb,
                  task: "0 Task",
                  title: "Could Do",
                ),

                SizedBox(width: 12),
              ],
            ),
          ),

          SpacingComponent(height: 16),

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
                        Get.toNamed('/listtaskPage');
                      },
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomText(
                          text: "See all",
                          color: SupportColor.grayColor,
                          weight: FontWeight.w500,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SpacingComponent(height: 12),

                // ListView.builder(
                //   itemCount: ,
                //   itemBuilder: (context, index) {}),
                CardTaskComponent(
                  color: PriorityColor.primaryColor,
                  title: "Belajar Flutter",
                  desc: "Belajar Component dan layouting Flutter",
                  startTime: "18.30",
                  endTime: "20.30",
                ),
              ],
            ),
          ),

          // Container(
          //   width: 327,
          //   height: 117,
          //   padding: EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     color: SupportColor.supportColor3,
          //     borderRadius:BorderRadius.circular(15)
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         children: [
          //           CustomText(
          //             text: "Belajar Flutter",
          //             color: SupportColor.whiteColor,
          //             weight: FontWeight.bold,
          //             size: 22),

          //           SizedBox(width: 113,),

          //           const Icon(Icons.more_vert, size: 20, color:SupportColor.whiteColor)

          //         ],
          //       ),

          //       SizedBox(height: 6),

          //       CustomText(
          //         text: "Belajar Component dan layouting Flutter",
          //         color: SupportColor.whiteColor,
          //         weight: FontWeight.w500,
          //         size: 13),

          //       SizedBox(height: 6),

          //       Text.rich(
          //         TextSpan(
          //           children: [
          //             WidgetSpan(
          //               alignment: PlaceholderAlignment.middle, // bikin sejajar
          //               child: Icon(Icons.access_time, size: 16, color: Colors.white),
          //             ),
          //         TextSpan(
          //           text: " 18.30 - 20.30",
          //           style: TextStyle(color: Colors.white, fontSize: 14),
          //         ),
          //           ],
          //         ),
          //       )
          //     ],
          //   )

          // )
        ],
      ),
    );
  }
}
