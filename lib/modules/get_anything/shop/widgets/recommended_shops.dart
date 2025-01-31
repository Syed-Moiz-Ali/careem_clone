import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecommendedShops extends StatelessWidget {
  const RecommendedShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonWidgets.sectionTitle('Recommended Shops', showIcon: false),
        const CustomGap(heightFactor: .02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return CustomPadding(
                horizontalFactor: .02,
                child: Container(
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
              );
            }),
          ),
        ),
      ],
    );
  }
}
