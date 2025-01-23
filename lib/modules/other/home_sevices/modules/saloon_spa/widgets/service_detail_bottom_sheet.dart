import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/utils/provider_util/provider_helper.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/enums/app_enums.dart';

class ServiceDetailBottomSheet extends StatelessWidget {
  final Map service;
  const ServiceDetailBottomSheet({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          serviceImageSection(),
          serviceDetails(service),
          const CustomGap(heightFactor: .05),
          addToCartSection(),
        ],
      ),
    );
  }
}

Widget serviceImageSection() {
  return Stack(
    children: [
      CustomImageWidget(
        imageUrl: '',
        height: 22.h,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        width: 100.w,
      ),
      Positioned(
        top: 2.w,
        right: 2.w,
        child: CommonWidgets.customAppBarIcon(
          icon: Icons.close,
          opTap: () {},
        ),
      ),
    ],
  );
}

Widget serviceDetails(Map service) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          serviceTitleAndPrice(service),
          const CustomGap(heightFactor: .02),
          dividerSection(),
          const CustomGap(heightFactor: .02),
          serviceDuration(),
          const CustomGap(heightFactor: .03),
          serviceInclusions(),
        ],
      ),
    ),
  );
}

Widget serviceTitleAndPrice(Map service) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextWidget(
        text: service['title'],
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      const CustomGap(heightFactor: .005),
      TextWidget(
        text: service['subTitle'],
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      const CustomGap(heightFactor: .02),
      Row(
        children: [
          TextWidget(
            text: 'AED109',
            fontSize: 16.sp,
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
          const CustomGap(widthFactor: .03),
          TextWidget(
            text: 'AED129',
            fontSize: 16.sp,
            color: AppColors.secondaryColor,
            decoration: TextDecoration.lineThrough,
          ),
        ],
      ),
    ],
  );
}

Widget dividerSection() {
  return Column(
    children: [
      Divider(
        color: AppColors.disabledColor.withOpacity(.3),
      ),
      const CustomGap(heightFactor: .02),
    ],
  );
}

Widget serviceDuration() {
  return const Row(
    children: [
      TextWidget(
        text: 'Duration: ',
        fontWeight: FontWeight.bold,
      ),
      TextWidget(
        text: '90 mins',
      ),
    ],
  );
}

Widget serviceInclusions() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const TextWidget(
        text: 'What is included: ',
        fontWeight: FontWeight.bold,
      ),
      const CustomGap(heightFactor: .006),
      Column(
        children: [
          inclusionRow('Classic Manicure'),
          inclusionRow('Classic Pedicure'),
        ],
      ),
    ],
  );
}

Widget inclusionRow(String inclusion) {
  return Row(
    children: [
      const CustomGap(widthFactor: .04),
      Container(
        width: 1.w,
        height: 1.w,
        decoration: BoxDecoration(
          color: AppColors.backgroundColorDark,
          borderRadius: BorderRadius.circular(10.w),
        ),
      ),
      const CustomGap(widthFactor: .02),
      TextWidget(
        text: inclusion,
      ),
    ],
  );
}

Widget addToCartSection() {
  return Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          quantitySelector(),
          PrimaryButton(
            onTap: () {},
            text: 'Add to Cart',
            width: .9,
            height: .06,
            borderRadius: 100.w,
            elevation: 0,
          ),
        ],
      ),
    ),
  );
}

Widget quantitySelector() {
  // Create a ValueNotifier to hold the quantity state
  ValueNotifier<int> quantityNotifier = ValueNotifier<int>(1);

  return ProviderHelper.valueBuilder.builder(
    valueListenable: quantityNotifier,
    builder: (quantity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.customAppBarIcon(
            icon: Icons.remove,
            opTap: () {
              // Decrement quantity when '-' button is pressed
              if (quantity > 1) {
                quantityNotifier.value = quantity - 1;
              }
            },
          ),
          const CustomGap(widthFactor: .03),
          TextWidget(
            text: '$quantity',
            styleType: TextStyleType.heading2,
          ),
          const CustomGap(widthFactor: .03),
          CommonWidgets.customAppBarIcon(
            icon: Icons.add,
            opTap: () {
              // Increment quantity when '+' button is pressed
              quantityNotifier.value = quantity + 1;
            },
          ),
        ],
      );
    },
  );
}
