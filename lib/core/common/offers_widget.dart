import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants/constants.dart';
import '../widgets/custom_image.dart';
import '../widgets/custom_padding.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      allSidesFactor: .02,
      child: Container(
        width: 50.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.disabledColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: const CustomImageWidget(
            fit: BoxFit.cover,
            imageUrl:
                'https://i.pinimg.com/originals/a4/e6/c3/a4e6c3241973e6f3560af85ff80eb87a.jpg',
          ),
        ),
      ),
    );
  }
}
