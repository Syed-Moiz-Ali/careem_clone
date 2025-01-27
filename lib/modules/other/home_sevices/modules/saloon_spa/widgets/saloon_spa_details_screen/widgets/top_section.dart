import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../../core/common/common_functions.dart';
import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../../core/widgets/custom_gap.dart';
import '../../../../../../../../core/widgets/custom_icon.dart';
import '../../../../../../../../core/widgets/custom_padding.dart';
import '../../../../../../../../core/widgets/text_widget.dart';
import '../../address_selection_bottom_sheet.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.progressIndex,
  });

  final int progressIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: progressIndex == 0 ? 15.h : 13.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LocationSelector(),
          const CustomGap(heightFactor: .02),
          _StepTitle(progressIndex: progressIndex),
          const CustomGap(heightFactor: .01),
          _ProgressBar(progressIndex: progressIndex),
          if (progressIndex < 3) _NextStepText(progressIndex: progressIndex),
        ],
      ),
    );
  }
}

class _LocationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CommonFunctions.customBottomSheet(
          child: const AddressSelectionBottomSheet(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidget(
            text: 'Dubai',
            styleType: TextStyleType.body,
            color: AppColors.disabledColor,
          ),
          CustomIconWidget(
            iconData: Icons.keyboard_arrow_down_rounded,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}

class _StepTitle extends StatelessWidget {
  const _StepTitle({required this.progressIndex});

  final int progressIndex;

  String _getStepTitle(int progressIndex) {
    switch (progressIndex) {
      case 0:
        return 'Service Details';
      case 1:
        return 'Popular add-ons';
      case 2:
        return 'Date & Time';
      case 3:
      default:
        return 'Checkout';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: _getStepTitle(progressIndex),
      styleType: TextStyleType.heading2,
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progressIndex});

  final int progressIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPadding(
          horizontalFactor: .02,
          child: Container(
            width: 100.w,
            height: .5.h,
            decoration: BoxDecoration(
              color: AppColors.disabledColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: CustomPadding(
            horizontalFactor: .02,
            child: Container(
              width: 23.w * (progressIndex + 1),
              height: .5.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NextStepText extends StatelessWidget {
  const _NextStepText({required this.progressIndex});

  final int progressIndex;

  String _getNextStepText(int progressIndex) {
    switch (progressIndex) {
      case 0:
        return 'Next step: Popular add-ons';
      case 1:
        return 'Next step: Date & Time';
      case 2:
        return 'Next step: Checkout';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      horizontalFactor: .02,
      child: TextWidget(
        text: _getNextStepText(progressIndex),
        fontSize: 14.sp,
      ),
    );
  }
}
