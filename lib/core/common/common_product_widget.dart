import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../modules/get_anything/groceries/screens/groceriesDetail/groceries_detail_screen.dart';
import 'common_widgets.dart';

class CommonProductWidget extends StatelessWidget {
  const CommonProductWidget({
    super.key,
    required this.product,
  });

  final Map product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NH.navigateTo(GroceriesDetailScreen(product: product));
      },
      child: Container(
        width: 35.w,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        // padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade200,
          //     blurRadius: 4,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomImageWidget(
                  imageUrl: product['imagePath'],
                  // height: 20.h,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(12),
                ),
                Positioned(
                    top: 1.h,
                    left: 2.w,
                    child: CommonWidgets.discountPercentCard(
                        discountPercent: product['discount'])

                    //  Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(3),
                    //     color: AppColors.errorColor,
                    //   ),
                    //   child: CustomPadding(
                    //     horizontalFactor: .01,
                    //     verticalFactor: .004,
                    //     child: TextWidget(
                    //       text: product['discount'],
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w700,
                    //       color: AppColors.backgroundColorLight,
                    //     ),
                    //   ),
                    // ),
                    ),
                Positioned(
                  bottom: 1.h,
                  right: 2.w,
                  child: Container(
                    height: 10.w,
                    width: 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.w),
                      color: AppColors.backgroundColorLight,
                    ),
                    child: CustomIconWidget(
                      iconData: Icons.add,
                      size: 20.sp,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            TextWidget(
              text: product['title'],
              maxLine: 2,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                TextWidget(
                  text: product['price'],
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(width: 4),
                TextWidget(
                  text: product['oldPrice'],
                  fontSize: 13.sp,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
