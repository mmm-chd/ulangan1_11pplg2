import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/cardview_component/cardview_wide.dart';
import 'package:ulangan1_11pplg2/components/widget/customtext_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/history_controller.dart';

class HistoryPageWide extends StatelessWidget {
  HistoryPageWide({super.key});

  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SupportColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Completed Tasks",
                    color: MainColor.primaryColor,
                    weight: FontWeight.bold,
                    size: 40,
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      size: 28,
                      color: MainColor.primaryColor,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          historyController.deleteAll();
                        },
                        value: 'delete all',
                        child: const Text('Delete All'),
                      ),
                    ],
                  ),
                ],
              ),

              const SpacingComponent(height: 24),

              // GRID
              Expanded(
                child: Obx(() {
                  final completedList = historyController.completedList;

                  if (completedList.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/animation/ghost.json',
                            width: 220,
                            height: 220,
                            frameRate: FrameRate(30),
                            backgroundLoading: true,
                            filterQuality: FilterQuality.low,
                          ),
                          const SpacingComponent(height: 20),
                          Text(
                            'No Completed Tasks Yet',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SpacingComponent(height: 10),
                          Text(
                            'Once you complete a task, it will appear here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final screenWidth = constraints.maxWidth;
                      final crossAxisCount = screenWidth > 600 ? 3 : 2;
                      final itemWidth =
                          (screenWidth - (crossAxisCount - 1) * 16) /
                          crossAxisCount;
                      final aspectRatio = itemWidth / 150;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: aspectRatio,
                        ),
                        itemCount: completedList.length,
                        itemBuilder: (context, index) {
                          final item = completedList[index];
                          return CardviewWide(
                            color: item.priority,
                            title: item.title,
                            desc: item.desc,
                            startTime: item.startTime.toString(),
                            endTime: item.endTime.toString(),
                            isCompleted: item.isCompleted,
                            isHistoryPage: true,
                            onTapItem: (value) {
                              historyController.onTapMenu(
                                value,
                                index,
                                item.isCompleted,
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
