import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/utils/provider_util/provider_helper.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/enums/app_enums.dart';

class FrequencySelectionBottomSheet extends StatelessWidget {
  const FrequencySelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // ValueNotifier to manage the selected frequency
    final ValueNotifier<String> selectedFrequency =
        ValueNotifier<String>('Weekly');

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: 'Choose your frequency',
            fontWeight: FontWeight.bold,
            styleType: TextStyleType.subheading2,
          ),
          const CustomGap(heightFactor: .02),
          _buildFrequencyOption(
            title: 'Weekly',
            discount: '10% off',
            description: [
              'Enjoy having the same professional every week',
              'Pause or cancel anytime'
            ],
            selectedFrequency: selectedFrequency,
          ),
          const CustomGap(heightFactor: .02),
          _buildFrequencyOption(
            title: 'Every 2 Weeks',
            discount: '10% off',
            description: [
              'Enjoy having the same professional every 2 week',
              'Pause or cancel anytime'
            ],
            selectedFrequency: selectedFrequency,
          ),
          const CustomGap(heightFactor: .02),
          _buildFrequencyOption(
            title: 'One time',
            discount: '10% off',
            description: [
              'Perfect pick when your schedule is uncertain',
            ],
            selectedFrequency: selectedFrequency,
          ),
        ],
      ),
    );
  }

  // Helper method to build each frequency option container
  Widget _buildFrequencyOption({
    required String title,
    required String discount,
    required List<String> description,
    required ValueNotifier<String> selectedFrequency,
  }) {
    return ProviderHelper.valueBuilder.builder(
        valueListenable: selectedFrequency,
        builder: (value) {
          return GestureDetector(
            onTap: () {
              selectedFrequency.value = title;
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.disabledColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomPadding(
                verticalFactor: .02,
                horizontalFactor: .03,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFrequencyTitleRow(title, selectedFrequency),
                    _buildDiscountCard(discount),
                    const CustomGap(heightFactor: .01),
                    const Divider(color: AppColors.disabledColor),
                    const CustomGap(heightFactor: .01),
                    ...description.map((text) => _buildBulletText(text)),
                  ],
                ),
              ),
            ),
          );
        });
  }

  // Helper method to build the title row for each frequency option
  Widget _buildFrequencyTitleRow(
      String title, ValueNotifier<String> selectedFrequency) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: title,
          fontWeight: FontWeight.bold,
          styleType: TextStyleType.subheading,
        ),
        Radio<String>(
          value: title,
          groupValue: selectedFrequency.value,
          onChanged: (selectedValue) {
            if (selectedValue != null) {
              selectedFrequency.value = selectedValue;
            }
          },
        ),
      ],
    );
  }

  // Helper method to build the discount card
  Widget _buildDiscountCard(String discount) {
    return SizedBox(
      width: 15.w,
      child: CommonWidgets.discountPercentCard(discountPercent: discount),
    );
  }

  // Helper method to build a bullet text item
  Widget _buildBulletText(String text) {
    return CommonWidgets.bulletText(
      child: TextWidget(
        text: text,
        styleType: TextStyleType.body2,
      ),
    );
  }
}
