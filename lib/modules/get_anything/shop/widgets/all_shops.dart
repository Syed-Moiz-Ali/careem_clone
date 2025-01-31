import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/modules/get_anything/shop/screens/shop_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common/common_widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_gap.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/text_widget.dart';

class AllShops extends StatelessWidget {
  const AllShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWidgets.sectionTitle('All Shops', showIcon: false),
        const CustomGap(heightFactor: .02),
        SingleChildScrollView(
          child: CustomPadding(
            horizontalFactor: .02,
            child: Column(
              children: List.generate(10, (index) {
                return GestureDetector(
                  onTap: () {
                    NH.navigateTo(const ShopDetailScreen());
                  },
                  child: CustomPadding(
                    verticalFactor: .01,
                    child: Row(
                      children: [
                        Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                              color: AppColors.disabledColor,
                              borderRadius: BorderRadius.circular(5.w)),
                          child: const Center(
                            child: TextWidget(
                              text: 'Shops',
                              color: AppColors.backgroundColorDark,
                            ),
                          ),
                        ),
                        const CustomGap(widthFactor: .02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              text: 'Graniose Supermarket',
                              styleType: TextStyleType.subheading2,
                              fontWeight: FontWeight.bold,
                            ),
                            CommonWidgets.buildRatingAndTime(
                              '4.8 (200k+) ',
                              '45 - 55 mins',
                            ),
                            const CustomGap(heightFactor: .03),
                            Row(
                              children: [
                                CommonWidgets.discountPercentCard(
                                  discountPercent: '50%',
                                  fontSize: 14.sp,
                                ),
                                const CustomGap(widthFactor: .015),
                                CommonWidgets.discountPercentCard(
                                  bgColor: AppColors.disabledColor,
                                  discountPercent: 'delivery by shop',
                                  fontSize: 14.sp,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
