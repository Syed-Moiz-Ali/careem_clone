// Flutter imports
import 'package:flutter/material.dart';
// Package imports
import 'package:sizer/sizer.dart';
// Core widgets
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/custom_textfiled.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
// Core utils
import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/enums/app_enums.dart';

class LaundryOrderSummary extends StatelessWidget {
  const LaundryOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Summary'),
      body: SingleChildScrollView(
        child: CustomPadding(
          horizontalFactor: .03,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildOrderDetails(),
              _buildTipSection(),
              _buildPromoCodeSection(),
              _buildPaymentSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Last Step',
          styleType: TextStyleType.heading2,
        ),
        CustomGap(heightFactor: .02),
        TextWidget(
          text: 'Order Summary',
          styleType: TextStyleType.subheading,
        ),
        CustomGap(heightFactor: .02),
      ],
    );
  }

  Widget _buildOrderDetails() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text:
              'Villa, Downtown, check out uw,-, so Collection Today, 3:00 pm - 4:00 pm Laundry Delivery +2 Days, Fit, Anytime during the day',
          maxLine: 30,
        ),
        CustomGap(heightFactor: .02),
        Divider(color: AppColors.disabledColor),
        CustomGap(heightFactor: .02),
      ],
    );
  }

  Widget _buildTipSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(
              text: 'Tip Your Captain',
              styleType: TextStyleType.body,
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: List.generate(3, (index) {
                return CustomPadding(
                  horizontalFactor: .01,
                  child: CommonWidgets.chipWidget(text: 'index $index'),
                );
              }),
            ),
          ],
        ),
        const CustomGap(heightFactor: .02),
        const Divider(color: AppColors.disabledColor),
        const CustomGap(heightFactor: .02),
      ],
    );
  }

  Widget _buildPromoCodeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Promocode',
          styleType: TextStyleType.subheading2,
        ),
        const CustomGap(heightFactor: .01),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: TextEditingController(),
                labelText: 'Enter Code',
              ),
            ),
            PrimaryButton(
              onTap: () {},
              text: 'Apply',
              width: .3,
              height: .06,
              bgColor: AppColors.disabledColor,
              borderRadius: 100.w,
            ),
          ],
        ),
        const CustomGap(heightFactor: .02),
        const Divider(color: AppColors.disabledColor),
        const CustomGap(heightFactor: .02),
      ],
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Payment Summary',
          styleType: TextStyleType.subheading2,
        ),
        const CustomGap(heightFactor: .01),
        CustomPadding(
          verticalFactor: .02,
          horizontalFactor: .02,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secondaryColor.withOpacity(.15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPaymentRow('Delivery fee', 'AED 9.50'),
                _buildPaymentRow('5% VAT', 'TBD'),
                const Divider(color: AppColors.disabledColor),
                const CustomPadding(
                  horizontalFactor: .04,
                  verticalFactor: .01,
                  child: TextWidget(
                    text: 'Total Determined After Sorting*',
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor,
                  ),
                ),
                _buildFinalAmountNotice(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentRow(String title, String amount) {
    return CustomPadding(
      horizontalFactor: .02,
      verticalFactor: .01,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: title),
          TextWidget(text: amount),
        ],
      ),
    );
  }

  Widget _buildFinalAmountNotice() {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withOpacity(.4),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),
      child: const CustomPadding(
        horizontalFactor: .02,
        verticalFactor: .01,
        child: Center(
          child: TextWidget(
            text:
                "*the final amount will be determined when your items are counted at whermen's facility",
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}
