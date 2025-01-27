import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DeliveryInstructions extends StatelessWidget {
  const DeliveryInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    Map instructions = {
      'collection': [
        'No prefrence',
        'Ring the door bell',
        'Knock on the door',
        'Do not disturb, bags outside',
        'Call me when you arrive',
      ],
      'laundry delivery': [
        'No prefrence',
        'Hang on door handle',
        'At concierge / reception',
      ],
    };
    return SizedBox(
      height: 70.h,
      width: 100.w,
      child: CustomPadding(
        horizontalFactor: .02,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomGap(heightFactor: .03),
            const TextWidget(
              text: 'Driver Instructions',
              styleType: TextStyleType.heading2,
            ),
            const CustomGap(heightFactor: .03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: instructions.entries.map((e) {
                var key = e.key;
                var data = List.from(e.value);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: key.toString(),
                      styleType: TextStyleType.body,
                      fontWeight: FontWeight.bold,
                    ),
                    const CustomGap(heightFactor: .02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data.map((d) {
                        return CustomPadding(
                            // verticalFactor: .00,
                            horizontalFactor: .03,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: d),
                                Radio(
                                    value: '',
                                    groupValue: '',
                                    onChanged: (value) {})
                              ],
                            ));
                      }).toList(),
                    ),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
