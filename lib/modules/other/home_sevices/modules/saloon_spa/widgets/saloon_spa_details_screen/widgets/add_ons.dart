import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../core/enums/app_enums.dart';

class AddOns extends StatelessWidget {
  const AddOns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextWidget(
            text: 'People also added', styleType: TextStyleType.heading2),
        const CustomGap(heightFactor: .02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(10, (index) {
              return CustomPadding(
                horizontalFactor: .02,
                child: SizedBox(
                  width: 40.w,
                  height: 35.h,

                  // height: 40.h,
                  // padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 40.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.disabledColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(11),
                              ),
                              child: CustomImageWidget(
                                  imageUrl: '',
                                  height: 12.h,
                                  width: double.infinity),
                            ),
                            const TextWidget(
                              text: 'Foot Massage 20 mins',
                              // styleType: TextStyleType.subheading,
                            ),
                            const TextWidget(
                              text:
                                  'foot massage improves circulation, stimulates muscles, reduces tension, and often eases pain.',
                              styleType: TextStyleType.body,
                            ),
                            const TextWidget(
                              text: 'Learn More',
                              // styleType: TextStyleType.heading2,
                            ),
                            const Row(
                              children: [
                                TextWidget(
                                  text: 'AED 49',
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomGap(widthFactor: .02),
                                TextWidget(
                                  text: 'AED 90',
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 3.w,
                        right: 10.w,
                        child: PrimaryButton(
                          onTap: () {},
                          text: '+Add',
                          width: .2,
                          height: .045,
                          borderRadius: 100.w,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
