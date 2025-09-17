import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:ulangan1_11pplg2/components/color/custom_color.dart';
import 'package:ulangan1_11pplg2/components/widget/space_component.dart';

class DateTimelineComponent extends StatelessWidget {
  final DateTime initialDate;
  final Function(DateTime) onChange;

  const DateTimelineComponent({
    super.key,
    required this.initialDate,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: initialDate,
      onDateChange: (date) {
        onChange(date);
      },
      itemBuilder: (context, date, isSelected, onTap) => GestureDetector(
        onTap: () => onTap(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color: isSelected
                      ? MainColor.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat("E").format(date),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SpacingComponent(height: 8),
                    Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 4,
                width: isSelected ? 24 : 0,
                decoration: BoxDecoration(
                  color: isSelected
                      ? MainColor.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
      timeLineProps: const EasyTimeLineProps(
        backgroundColor: Colors.transparent,
      ),
      locale: 'en_US',
      dayProps: const EasyDayProps(dayStructure: DayStructure.dayNumDayStr),
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.custom('EEEE d'),
        showMonthPicker: true,
        monthPickerType: MonthPickerType.switcher,
      ),
    );
  }
}
