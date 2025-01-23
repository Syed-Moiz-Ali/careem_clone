import 'package:careem/core/common/common_functions.dart';
import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../../core/utils/provider_util/provider_helper.dart';
import '../../frequency_selection_bottom_sheet.dart';

class DateTimeSelection extends StatelessWidget {
  final String? type;
  const DateTimeSelection({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    // Declare ValueNotifiers for selectedIndex and selectedDateIndex
    ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);
    ValueNotifier<int> selectedDateIndexNotifier = ValueNotifier<int>(0);
    ValueNotifier<int> selectedTimeIndexNotifier = ValueNotifier<int>(0);
    DateTime today = DateTime.now(); // Get today's date

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (type == 'homeCleaning')
            GestureDetector(
              onTap: () {
                CommonFunctions.customBottomSheet(
                  child: const FrequencySelectionBottomSheet(),
                );
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.backgroundColorLight,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.disabledColor.withOpacity(.5),
                          blurRadius: 5,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: CustomPadding(
                      horizontalFactor: .03,
                      verticalFactor: .02,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month_outlined),
                              const CustomGap(widthFactor: .01),
                              TextWidget(
                                text: 'Repeats Bi-weekly',
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomGap(heightFactor: .03),
                ],
              ),
            ),
          _buildProfessionalSelection(selectedIndexNotifier),
          const CustomGap(heightFactor: .02),
          _buildDateSelection(selectedDateIndexNotifier, today),
          const CustomGap(heightFactor: .02),
          _buildTimeSelection(selectedTimeIndexNotifier),
          const CustomGap(heightFactor: .03),
          CommonWidgets.noticeWidget(
            notice:
                'Enjoy free cancellation up to 6 hours before your booking start time',
            onDetailPressed: () {},
          ),
          const CustomGap(heightFactor: .03),
          _instructionWidget(),
        ],
      ),
    );
  }

  // Build the professional selection section
  Widget _buildProfessionalSelection(ValueNotifier<int> selectedIndexNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Which professional do you prefer?',
          styleType: TextStyleType.body,
          fontWeight: FontWeight.bold,
        ),
        const CustomGap(heightFactor: .01),
        TextWidget(
          text: 'Top-rated professional in your area',
          fontSize: 15.sp,
          color: AppColors.disabledColor,
        ),
        const CustomGap(heightFactor: .03),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return _buildProfessionalCard(
                index,
                selectedIndexNotifier,
              );
            }),
          ),
        ),
      ],
    );
  }

  // Build each professional card with the index passed
  Widget _buildProfessionalCard(
      int index, ValueNotifier<int> selectedIndexNotifier) {
    return ProviderHelper.valueBuilder.builder(
      valueListenable: selectedIndexNotifier,
      builder: (selectedIndex) {
        return InkWell(
          onTap: () {
            selectedIndexNotifier.value = index; // Update selectedIndex
          },
          child: CustomPadding(
            horizontalFactor: .01,
            child: Container(
              height: 30.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColors.primaryColor
                      : AppColors.disabledColor,
                ),
              ),
              child: Column(
                children: [
                  const CustomGap(heightFactor: .03),
                  CustomImageWidget(
                    imageUrl: '',
                    borderRadius: BorderRadius.circular(100.w),
                    width: 20.w,
                    height: 20.w,
                  ),
                  const CustomGap(heightFactor: .01),
                  const TextWidget(
                    text: '4.9',
                    styleType: TextStyleType.body,
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomGap(heightFactor: .01),
                  const TextWidget(
                    text: 'Vamshi',
                    styleType: TextStyleType.body,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomGap(heightFactor: .01),
                  const TextWidget(
                    maxLine: 3,
                    text: 'Recommended in your area',
                    textAlign: TextAlign.center,
                    styleType: TextStyleType.body2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Build the date selection section
  Widget _buildDateSelection(
      ValueNotifier<int> selectedDateIndexNotifier, DateTime today) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'When would you like your service?',
          styleType: TextStyleType.body,
          fontWeight: FontWeight.bold,
        ),
        const CustomGap(heightFactor: .01),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              DateTime date = today.add(Duration(days: index));
              return _buildDateCard(date, index, selectedDateIndexNotifier);
            }),
          ),
        ),
      ],
    );
  }

  // Build each date card with the date passed
  Widget _buildDateCard(
      DateTime date, int index, ValueNotifier<int> selectedDateIndexNotifier) {
    String day = getDayOfWeek(date);
    String dateString = date.day.toString();

    return ProviderHelper.valueBuilder.builder(
      valueListenable: selectedDateIndexNotifier,
      builder: (selectedDateIndex) {
        return SizedBox(
          width: 16.w,
          height: 23.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPadding(
                horizontalFactor: .02,
                child: TextWidget(
                  text: day,
                  fontWeight: FontWeight.bold,
                  styleType: TextStyleType.body,
                ),
              ),
              const CustomGap(heightFactor: .01),
              InkWell(
                onTap: () {
                  selectedDateIndexNotifier.value =
                      index; // Update selectedDateIndex
                },
                child: Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                      color: selectedDateIndex == index
                          ? AppColors.primaryColor
                          : AppColors.disabledColor.withOpacity(.5),
                    ),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: dateString,
                      color: AppColors.disabledColor,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimeSelection(ValueNotifier<int> selectedTimeIndexNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'What time would you like your service?',
          styleType: TextStyleType.body,
          fontWeight: FontWeight.bold,
        ),
        const CustomGap(heightFactor: .02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return _buildTimeCard(index, selectedTimeIndexNotifier);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeCard(
      int index, ValueNotifier<int> selectedTimeIndexNotifier) {
    return ProviderHelper.valueBuilder.builder(
        valueListenable: selectedTimeIndexNotifier,
        builder: (selectedTimeIndex) {
          return SizedBox(
            width: 36.w,
            height: 15.w,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        selectedTimeIndexNotifier.value =
                            index; // Update selectedDateIndex
                        // Update selectedTimeIndex
                      },
                      child: Container(
                        width: 30.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          border: Border.all(
                            color: selectedTimeIndex == index
                                ? AppColors.primaryColor
                                : AppColors.disabledColor.withOpacity(.5),
                          ),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: '10:00-11:00',
                                styleType: TextStyleType.body1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 1.w,
                  left: -1.w,
                  right: 5.w,
                  child: CustomPadding(
                    horizontalFactor: .055,
                    child: CommonWidgets.discountPercentCard(
                      discountPercent: 'AED 50 Extra',
                      bgColor: AppColors.disabledColor.withOpacity(.5),
                      txtColor: AppColors.backgroundColorDark,
                      // txtColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _instructionWidget() {
    TextEditingController controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Any instructions or special requirements?',
          styleType: TextStyleType.body,
          fontWeight: FontWeight.bold,
        ),
        const CustomGap(heightFactor: .01),
        Container(
          height: 20.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.disabledColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type here...',
                hintStyle: TextStyle(
                  color: AppColors.disabledColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Utility method to get the day of the week as a string
  String getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
}
