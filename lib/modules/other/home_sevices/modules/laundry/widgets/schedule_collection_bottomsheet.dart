import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/enums/app_enums.dart';

class ScheduleCollectionBottomsheet extends StatelessWidget {
  const ScheduleCollectionBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedDateIndex = ValueNotifier<int>(0);
    final ValueNotifier<int> selectedTimeSlotIndex = ValueNotifier<int>(0);
    final DateTime now = DateTime.now();

    List<DateTime> generateDates(int numDays) {
      return List.generate(numDays, (index) => now.add(Duration(days: index)));
    }

    List<String> timeSlots = [
      '12:00 pm - 1:00 pm',
      '1:00 pm - 2:00 pm',
      '2:00 pm - 3:00 pm',
      '3:00 pm - 4:00 pm',
      '4:00 pm - 5:00 pm',
      '5:00 pm - 6:00 pm',
      '6:00 pm - 7:00 pm',
      '7:00 pm - 8:00 pm',
      '8:00 pm - 9:00 pm',
      '9:00 pm - 10:00 pm',
    ];

    return SizedBox(
      height: 70.h,
      width: 100.w,
      child: Stack(
        children: [
          CustomPadding(
            horizontalFactor: .03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomGap(heightFactor: .02),
                const TextWidget(
                  text: 'Collection in person',
                  styleType: TextStyleType.heading2,
                ),
                const CustomGap(heightFactor: .03),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDateColumn(
                        selectedDateIndex,
                        generateDates(timeSlots.length),
                        now,
                      ),
                      _buildTimeSlotColumn(
                        selectedTimeSlotIndex,
                        timeSlots,
                      ),
                    ],
                  ),
                ),
                const CustomGap(heightFactor: .1),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonWidgets.navigationBackIcon(),
                PrimaryButton(
                  onTap: () {},
                  text: 'Done',
                  width: .7,
                  borderRadius: 100.w,
                  textColor: AppColors.backgroundColorDark,
                  styleType: TextStyleType.subheading2,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDateColumn(
    ValueNotifier<int> selectedDateIndex,
    List<DateTime> dates,
    DateTime now,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(dates.length, (index) {
          DateTime date = dates[index];
          return ValueListenableBuilder<int>(
            valueListenable: selectedDateIndex,
            builder: (context, selectedIndex, child) {
              return GestureDetector(
                onTap: () {
                  selectedDateIndex.value = index;
                },
                child: Container(
                  width: 35.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                  margin: EdgeInsets.symmetric(vertical: 1.5.w),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? AppColors.primaryColor.withOpacity(.1)
                        : null,
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(
                      color: selectedIndex == index
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: _getDynamicLabel(date, now),
                        fontWeight:
                            selectedIndex == index ? FontWeight.bold : null,
                        fontSize: 17.sp,
                      ),
                      const CustomGap(heightFactor: .005),
                      TextWidget(
                        text: DateFormat('MMM dd').format(date),
                        styleType: TextStyleType.body2,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  Widget _buildTimeSlotColumn(
    ValueNotifier<int> selectedTimeSlotIndex,
    List<String> timeSlots,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(timeSlots.length, (index) {
          var timeSlot = timeSlots[index];
          return ValueListenableBuilder<int>(
            valueListenable: selectedTimeSlotIndex,
            builder: (context, selectedIndex, child) {
              return GestureDetector(
                onTap: () {
                  selectedTimeSlotIndex.value = index;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                  margin: EdgeInsets.symmetric(vertical: 1.5.w),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? AppColors.primaryColor.withOpacity(.1)
                        : null,
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(
                      color: selectedIndex == index
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: 'Between',
                        styleType: TextStyleType.body2,
                      ),
                      const CustomGap(heightFactor: .005),
                      TextWidget(
                        text: timeSlot,
                        fontWeight:
                            selectedIndex == index ? FontWeight.bold : null,
                        fontSize: 17.sp,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  String _getDynamicLabel(DateTime date, DateTime now) {
    if (date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      return "Today";
    } else if (date.day == now.add(const Duration(days: 1)).day &&
        date.month == now.add(const Duration(days: 1)).month &&
        date.year == now.add(const Duration(days: 1)).year) {
      return "Tomorrow";
    } else {
      return DateFormat('EEEE').format(date);
    }
  }
}
