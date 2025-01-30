import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BoxDelivery extends StatelessWidget {
  const BoxDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Box',
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          const CustomGap(heightFactor: .03),
          Row(
            children: [
              _buildDeliveryBox(),
              _buildDeliveryBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryBox() {
    return SizedBox(
      width: 50.w,
      child: CustomPadding(
        verticalFactor: .01,
        horizontalFactor: .02,
        child: Column(
          children: [
            CustomImageWidget(
              imageUrl: '',
              height: 25.h,
              width: double.infinity,
              borderRadius: BorderRadius.circular(8),
            ),
            const TextWidget(text: 'Box Delivery', fontWeight: FontWeight.bold),
            const TextWidget(
              text: 'Send an item from point A to B',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
