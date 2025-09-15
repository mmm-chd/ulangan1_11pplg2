import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/button_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/customtextfield2_component.dart';
import 'package:ulangan1_11pplg2/controller/add_edit_task_controller.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final AddEditTaskController addEditTaskController =
      Get.find<AddEditTaskController>();

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
                    Get.back();
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
                      controller: addEditTaskController.titleEditingController,
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
                      controller: addEditTaskController.descEditingController,
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

                    Obx(
                      () => CustomTextField2(
                        controller: addEditTaskController.dateEditingController,
                        readOnly: true,
                        hintText: addEditTaskController.dueDate(),
                        outlineColor: SupportColor.stroke,
                        borderRadius: 5,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () =>
                              addEditTaskController.pickerDate(context),
                        ),
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

                              Obx(
                                () => CustomTextField2(
                                  controller: addEditTaskController
                                      .startTimeEditingController,
                                  readOnly: true,
                                  hintText: addEditTaskController.sTimer(),
                                  outlineColor: SupportColor.stroke,
                                  borderRadius: 5,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.access_time),
                                    onPressed: () => addEditTaskController
                                        .spickerTime(context),
                                  ),
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

                              Obx(
                                () => CustomTextField2(
                                  controller: addEditTaskController
                                      .endTimeEditingController,
                                  readOnly: true,
                                  hintText: addEditTaskController.eTimer(),
                                  outlineColor: SupportColor.stroke,
                                  suffixIcon: IconButton(
                                    onPressed: () => addEditTaskController
                                        .epickerTime(context),
                                    icon: Icon(Icons.access_time),
                                  ),
                                  borderRadius: 5,
                                ),
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

                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: addEditTaskController.listPriority.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => ButtonComponent(
                              weight: FontWeight.w600,
                              backgroundColor:
                                  addEditTaskController
                                      .listPriority[index]
                                      .priorityBool
                                      .value
                                  ? addEditTaskController
                                        .listPriority[index]
                                        .color
                                  : Colors.transparent,
                              outlineColor: addEditTaskController
                                  .listPriority[index]
                                  .color,
                              text: addEditTaskController
                                  .listPriority[index]
                                  .priorityText,
                              onPressed: () {
                                addEditTaskController.onHandle(index);
                              },
                            ),
                          );
                        },
                      ),
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
                  backgroundColor: MainColor.primaryColor,
                  text: addEditTaskController.getButtonText(),
                  size: 24,
                  weight: FontWeight.bold,
                  onPressed: addEditTaskController.saveTask,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
