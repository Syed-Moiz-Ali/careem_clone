import 'package:careem/core/common/common_functions.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/utils/provider_util/provider_helper.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../../core/common/common_widgets.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomPadding(
        horizontalFactor: .02,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaymentMethodSection(),
            const CustomGap(heightFactor: .03),
            _buildVoucherSection(),
            const CustomGap(heightFactor: .03),
            _buildPaymentSummarySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    final ValueNotifier<String> paymentMethodNotifier =
        ValueNotifier<String>('Careem Pay');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Payment method',
          fontWeight: FontWeight.bold,
          styleType: TextStyleType.body,
        ),
        const CustomGap(heightFactor: .02),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.backgroundColorLight,
            boxShadow: [
              BoxShadow(
                color: AppColors.disabledColor.withOpacity(.5),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: InkWell(
            overlayColor:
                const WidgetStatePropertyAll<Color>(AppColors.transparent),
            onTap: () {
              CommonFunctions.customBottomSheet(
                  child: ProviderHelper.valueBuilder.builder(
                valueListenable: paymentMethodNotifier,
                builder: (selectedMethod) {
                  return SizedBox(
                    height: 25.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          text: 'Select Payment Method',
                          styleType: TextStyleType.subheading2,
                          fontWeight: FontWeight.bold,
                        ),
                        const CustomGap(heightFactor: .03),
                        _buildPaymentMethodRow(
                            'Careem Pay',
                            'Credit Card',
                            // selectedMethod,
                            paymentMethodNotifier),
                        const CustomGap(heightFactor: .02),
                        _buildPaymentMethodRow(
                            'Cash',
                            'Pay on arrival',
                            // selectedMethod,
                            paymentMethodNotifier),
                      ],
                    ),
                  );
                },
              ));
            },
            child: CustomPadding(
              horizontalFactor: .03,
              verticalFactor: .02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.credit_card),
                      const CustomGap(widthFactor: .01),
                      TextWidget(
                        text: 'Pay with careem pay',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodRow(String method, String description,
      ValueNotifier<String> paymentMethodNotifier) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll<Color>(AppColors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: method,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
              const CustomGap(heightFactor: .005),
              TextWidget(
                text: description,
                fontSize: 14.sp,
                color: AppColors.disabledColor,
              ),
            ],
          ),
          Icon(
            Icons.check_circle,
            color: method == paymentMethodNotifier.value
                ? AppColors.primaryColor
                : AppColors.disabledColor,
          ),
        ],
      ),
      onTap: () {
        paymentMethodNotifier.value = method;
      },
    );
  }

  Widget _buildVoucherSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Add Voucher Code',
          fontWeight: FontWeight.bold,
          styleType: TextStyleType.body,
        ),
        const CustomGap(heightFactor: .02),
        Container(
          width: 40.w,
          height: 22.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.disabledColor.withOpacity(.5),
            ),
          ),
          child: const CustomPadding(
            horizontalFactor: .03,
            verticalFactor: .02,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Voucher Code',
                  styleType: TextStyleType.body,
                ),
                CustomGap(heightFactor: .005),
                TextWidget(
                  text: '+Add',
                  color: AppColors.primaryColor,
                  styleType: TextStyleType.body,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentSummarySection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomPadding(
        horizontalFactor: .03,
        verticalFactor: .02,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'Payment Summary',
              styleType: TextStyleType.body,
              fontWeight: FontWeight.bold,
            ),
            const CustomGap(heightFactor: .01),
            _buildPaymentSummaryRow('1x ', 'Winter Mani-Pedi Combo'),
            _buildPaymentSummaryRow('', '23 Jan, 11:30-12:00'),
            const CustomGap(heightFactor: .01),
            const _SummaryRow(label: 'Subtotal', value: 'AED 100'),
            const CustomGap(heightFactor: .01),
            const _SummaryRow(label: 'Service charge', value: 'AED 10'),
            const CustomGap(heightFactor: .02),
            Divider(
              color: AppColors.disabledColor.withOpacity(.5),
            ),
            const CustomGap(heightFactor: .02),
            const _SummaryRow(
              label: 'Total',
              value: 'AED 110',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummaryRow(String label, String value) {
    return Row(
      children: [
        const CustomGap(widthFactor: .03),
        CommonWidgets.bulletText(
          child: TextWidget(
            text: label,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (value.isNotEmpty)
          TextWidget(
            text: value,
            fontSize: 14.sp,
          ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  final String label;
  final String value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: label,
          styleType: TextStyleType.body,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
        TextWidget(
          text: value,
          styleType: TextStyleType.body,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          color: isTotal ? AppColors.secondaryColor : null,
        ),
      ],
    );
  }
}
