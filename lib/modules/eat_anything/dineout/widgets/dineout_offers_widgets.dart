import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/utils/app_list.dart';
import '../../../../core/widgets/custom_gap.dart';
import '../../../../core/widgets/custom_padding.dart';
import 'dineout_card.dart';

class DineOutOffersWidgets extends StatelessWidget {
  const DineOutOffersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    List dineOutList = AppList.dineOutList;

    return Container(
      height: 50.h,
      color: AppColors.secondaryColor,
      child: CustomPadding(
        allSidesFactor: .03,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: 'Tasty Trails by DineOut',
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundColorLight,
                  styleType: TextStyleType.subheading,
                ),
                CustomIconWidget(
                  iconData: Icons.arrow_forward_ios,
                  size: 20.sp,
                  color: AppColors.backgroundColorLight,
                )
              ],
            ),
            const TextWidget(
              text: "Try Marina's homegrown spots for coffee & more",
              color: AppColors.backgroundColorLight,
              styleType: TextStyleType.body2,
            ),
            const CustomGap(heightFactor: .03),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(dineOutList.length, (index) {
                  var dineOut = dineOutList[index];
                  return CustomPadding(
                    horizontalFactor: .01,
                    child: DineOutCard(
                      data: dineOut,
                      cardType: DineOutCardType.poweredBy,
                    ),
                  );
                }).toList(),
              ),
            ),
            const CustomGap(heightFactor: .02),
          ],
        ),
      ),
    );
  }
}
