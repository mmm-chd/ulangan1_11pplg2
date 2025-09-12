import 'package:flutter/material.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/button_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtextfield2_component.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF4E2EC),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: MainColor.primaryColor,
                    ),
                  ),
                ),
                const CustomText(
                  text: "Add Task",
                  color: MainColor.primaryColor,
                  weight: FontWeight.bold,
                  size: 36,
                ),
              ],
            ),

            const SizedBox(height: 40),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(
                        color: TextColor.primaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    CustomTextField2(
                      hintText: "Enter task title...",
                      outlineColor: SupportColor.stroke,
                      borderRadius: 5,
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Descriptions",
                      style: TextStyle(
                        color: TextColor.primaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    CustomTextField2(
                      hintText: "Enter description task...",
                      outlineColor: SupportColor.stroke,
                      borderRadius: 5,
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Due Date",
                      style: TextStyle(
                        color: TextColor.primaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    CustomTextField2(
                      hintText: "Due Date",
                      outlineColor: SupportColor.stroke,
                      borderRadius: 5,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () {},
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Start Time",
                                style: TextStyle(
                                  color: TextColor.primaryTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              CustomTextField2(
                                hintText: "Start Time",
                                outlineColor: SupportColor.stroke,
                                borderRadius: 5,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.date_range),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "End Time",
                                style: TextStyle(
                                  color: TextColor.primaryTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              CustomTextField2(
                                hintText: "End Time",
                                outlineColor: SupportColor.stroke,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.access_time),
                                ),
                                borderRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Priority",
                      style: TextStyle(
                        color: TextColor.primaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: ButtonComponent(
                            height: 40,
                            width: 100,
                            size: 13,
                            borderRadius: 10,
                            color: PriorityColor.primaryColor,
                            text: "Must Do",
                            weight: FontWeight.bold,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ButtonComponent(
                            height: 40,
                            width: 80,
                            size: 13,
                            borderRadius: 10,
                            color: PriorityColor.secondaryColor,
                            text: "Should Do",
                            weight: FontWeight.bold,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ButtonComponent(
                            height: 40,
                            width: 80,
                            size: 13,
                            borderRadius: 10,
                            color: PriorityColor.accentColor,
                            text: "Could Do",
                            weight: FontWeight.bold,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: SizedBox(
                width: double.infinity,
                child: ButtonComponent(
                  height: 60,
                  width: 376,
                  color: MainColor.primaryColor,
                  text: "Add Task",
                  size: 24,
                  weight: FontWeight.bold,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
