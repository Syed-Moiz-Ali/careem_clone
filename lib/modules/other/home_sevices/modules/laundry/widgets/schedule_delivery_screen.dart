import 'package:careem/core/common/common_functions.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/utils/provider_util/provider_helper.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'schedule_collection_bottomsheet.dart';

class ScheduleDeliveryScreen extends StatelessWidget {
  const ScheduleDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedTypeIndex = ValueNotifier<int>(0);
    return ProviderHelper.valueBuilder.builder(
        valueListenable: selectedTypeIndex,
        builder: (selectedIndex) {
          return Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                const CustomGap(heightFactor: .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        selectedTypeIndex.value = 0;
                      },
                      child: Container(
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: selectedTypeIndex.value == 0
                              ? AppColors.primaryColor.withOpacity(.1)
                              : null,
                          borderRadius: BorderRadius.circular(3.w),
                          border: Border.all(
                            color: selectedTypeIndex.value == 0
                                ? AppColors.primaryColor
                                : AppColors.disabledColor,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                        child: Column(
                          children: [
                            CustomImageWidget(
                              imageUrl: '',
                              width: 43.w,
                              height: 22.h,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(3.w)),
                            ),
                            const CustomGap(heightFactor: .01),
                            const TextWidget(
                              text: 'Delivery at door',
                              styleType: TextStyleType.body,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedTypeIndex.value = 1;
                      },
                      child: Container(
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: selectedTypeIndex.value == 1
                              ? AppColors.primaryColor.withOpacity(.1)
                              : null,
                          borderRadius: BorderRadius.circular(3.w),
                          border: Border.all(
                              color: selectedTypeIndex.value == 1
                                  ? AppColors.primaryColor
                                  : AppColors.disabledColor,
                              strokeAlign: BorderSide.strokeAlignOutside),
                        ),
                        child: Column(
                          children: [
                            CustomImageWidget(
                              imageUrl: '',
                              width: 43.w,
                              height: 22.h,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(3.w)),
                            ),
                            const CustomGap(heightFactor: .01),
                            const TextWidget(
                              text: 'Delivery in person',
                              styleType: TextStyleType.body,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomGap(heightFactor: .03),
                TextWidget(
                  textAlign: TextAlign.center,
                  text: selectedIndex == 0
                      ? "We'll will hang your clean laundry outside your door"
                      : "Meet th captan in preson and receive your clean clothes",
                  styleType: TextStyleType.body,
                ),
                const CustomGap(heightFactor: .03),
                PrimaryButton(
                  onTap: () {
                    CommonFunctions.customBottomSheet(
                        addPadding: false,
                        child: const ScheduleCollectionBottomsheet());
                  },
                  text: 'Continue',
                  width: .8,
                  borderRadius: 100.w,
                ),
              ],
            ),
          );
        });
  }
}
