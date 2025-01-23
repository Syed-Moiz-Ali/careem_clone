import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/utils/app_list.dart';
import '../../../../../../core/widgets/custom_gap.dart';
import '../../../../../../core/widgets/custom_icon.dart';
import '../../../../../../core/widgets/custom_padding.dart';
import '../../../../../../core/widgets/custom_textfiled.dart';
import '../../../../../../core/widgets/text_widget.dart';

class AddressSelectionBottomSheet extends StatelessWidget {
  final TextEditingController controller;

  const AddressSelectionBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 15.w,
              height: 1.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.backgroundColorDark,
              ),
            ),
          ),
          const CustomGap(heightFactor: .02),
          const TextWidget(
            text: 'Select Address',
            styleType: TextStyleType.heading2,
          ),
          const CustomGap(heightFactor: .02),
          CustomTextField(
            controller: controller,
            radius: 100.w,
            labelText: 'search',
            suffixIcon: CustomIconWidget(
              iconData: Icons.search_rounded,
              size: 25.sp,
            ),
          ),
          const CustomGap(heightFactor: .02),
          Expanded(
            child: ListView.builder(
              itemCount: AppList.addressList.length,
              itemBuilder: (context, index) {
                var address = AppList.addressList[index];
                return CustomPadding(
                  verticalFactor: .018,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomIconWidget(
                                iconData: address['prefixIcon'],
                                size: 22.sp,
                              ),
                              if (address['kilometes'] != null)
                                TextWidget(
                                  text: address['kilometes'],
                                  color: AppColors.secondaryColor,
                                ),
                            ],
                          ),
                          const CustomGap(widthFactor: .07),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: address['title'],
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              if (address['subTitle'] != null)
                                TextWidget(
                                  text: address['subTitle'],
                                ),
                            ],
                          ),
                        ],
                      ),
                      CustomIconWidget(
                        iconData: address['suffixIcon'],
                        size: 20.sp,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
