import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:careem/modules/other/home_sevices/modules/saloon_spa/widgets/service_detail_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common/common_functions.dart';

class SaloonSpaCard extends StatelessWidget {
  final Map item;
  const SaloonSpaCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CommonFunctions.customBottomSheet(
          child: ServiceDetailBottomSheet(
            service: item,
          ),
          addPadding: false,
        );
      },
      child: CustomPadding(
        topFactor: .01,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageWidget(
              imageUrl: '',
              height: 12.h,
              borderRadius: BorderRadius.circular(8),
            ),
            const CustomGap(widthFactor: .02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: item['title'],
                    // styleType: TextStyleType.subheading,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  TextWidget(maxLine: 4, text: item['subTitle']),
                  // TextWidget(maxLine: 4, text: item['type']),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          TextWidget(
                            text: 'AED 109',
                            fontWeight: FontWeight.bold,
                          ),
                          CustomGap(widthFactor: .02),
                          TextWidget(
                            text: 'AED 129',
                            decoration: TextDecoration.lineThrough,
                          ),
                        ],
                      ),
                      PrimaryButton(
                        onTap: () {},
                        text: '+Add',
                        width: .22,
                        height: .04,
                        // textColor: AppColors.backgroundColorDark,
                        borderRadius: 100.w,
                        bgColor: AppColors.secondaryColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
