import 'package:careem/core/constants/images_constant.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';
import '../widgets/custom_image.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      allSidesFactor: .02,
      child: Container(
        width: double.infinity,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.disabledColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: const CustomImageWidget(
            fit: BoxFit.fill,
            imageUrl: ImagesPath.banners,
          ),
        ),
      ),
    );
  }
}
