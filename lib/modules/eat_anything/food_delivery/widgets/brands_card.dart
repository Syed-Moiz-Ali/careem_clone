import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BrandsCard extends StatelessWidget {
  const BrandsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageWidget(
          imageUrl: '',
          width: 25.w,
          height: 25.w,
          borderRadius: BorderRadius.circular(100.w),
          fit: BoxFit.cover,
        ),
        const TextWidget(text: 'brand')
      ],
    );
  }
}
