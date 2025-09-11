import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:intl/intl.dart';
import 'package:ulangan1_11pplg2/components/widget/easydatetime_component.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';
import 'package:ulangan1_11pplg2/controller/list_task_controller.dart';

class ListTaskPage extends StatelessWidget {
  ListTaskPage({super.key});

  final ListTaskController listTaskController = Get.find<ListTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // ignore: deprecated_member_use
                    color: MainColor.primaryColor.withOpacity(0.2),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                    splashRadius: 22.5,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MainColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: SupportColor.whiteColor,
                    size: 24,
                  ),
                  label: const Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),

          SpacingComponent(height: 20),

          // EasyDateTimeLine(
          //   initialDate: DateTime.now(),
          //   itemBuilder: (context, date, isSelected, onTap) => GestureDetector(
          //     onTap: () {
          //       onTap();
          //     },
          //     child: Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 4),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           AnimatedContainer(
          //             duration: const Duration(milliseconds: 200),
          //             margin: const EdgeInsets.symmetric(vertical: 8),
          //             alignment: Alignment.center,
          //             width: 60,
          //             height: 70,
          //             decoration: BoxDecoration(
          //               color: isSelected
          //                   ? MainColor.primaryColor
          //                   : Colors.transparent,
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //             child: Ink(
          //               child: Column(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   Text(
          //                     DateFormat("E").format(date),
          //                     style: TextStyle(
          //                       color: isSelected ? Colors.white : Colors.black,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 8),
          //                   Text(
          //                     date.day.toString(),
          //                     style: TextStyle(
          //                       color: isSelected ? Colors.white : Colors.black,
          //                       fontSize: 24,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           AnimatedContainer(
          //             duration: const Duration(milliseconds: 200),
          //             height: 4,
          //             width: isSelected ? 24 : 0,
          //             decoration: BoxDecoration(
          //               color: isSelected
          //                   ? MainColor.primaryColor
          //                   : Colors.transparent,
          //               shape: BoxShape.rectangle,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          //   timeLineProps: EasyTimeLineProps(
          //     backgroundColor: Colors.transparent,
          //   ),
          //   locale: 'en_US',
          //   dayProps: EasyDayProps(dayStructure: DayStructure.dayNumDayStr),
          //   headerProps: EasyHeaderProps(
          //     dateFormatter: DateFormatter.custom('EEEE d'),
          //     showMonthPicker: true,
          //     monthPickerType: MonthPickerType.switcher,
          //   ),
          // ),
          DateTimelineComponent()
        ],
      ),
    );
  }
}
