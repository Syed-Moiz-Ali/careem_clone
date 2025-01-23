import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/provider_util/provider_helper.dart';

class HomeCleaningService extends StatelessWidget {
  const HomeCleaningService({super.key});

  @override
  Widget build(BuildContext context) {
    // Define ValueNotifiers for updating selected index values
    final ValueNotifier<int> selectedDateIndex = ValueNotifier<int>(0);
    final ValueNotifier<int> selectedProfessionalsIndex = ValueNotifier<int>(0);
    final ValueNotifier<int> cleaningMaterialsIndex = ValueNotifier<int>(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuestionText(
            'How many hours do you need your professional to stay?'),
        _buildChoiceSelection(
          count: 8,
          selectedIndexNotifier: selectedDateIndex,
        ),
        const CustomGap(heightFactor: .03),
        _buildQuestionText('How many professionals do you want?'),
        _buildChoiceSelection(
          count: 4,
          selectedIndexNotifier: selectedProfessionalsIndex,
        ),
        const CustomGap(heightFactor: .03),
        _buildQuestionText('Need cleaning materials?'),
        _buildMaterialChoiceSelection(cleaningMaterialsIndex),
      ],
    );
  }

  // Helper method to build the question text
  Widget _buildQuestionText(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: text,
          // styleType: TextStyleType.body,
          fontWeight: FontWeight.bold,
          fontSize: 17.sp,
          maxLine: 3,
        ),
        const CustomGap(heightFactor: .02),
      ],
    );
  }

  // Helper method to build choice selection (hours or professionals)
  Widget _buildChoiceSelection({
    required int count,
    required ValueNotifier<int> selectedIndexNotifier,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(count, (index) {
          return ProviderHelper.valueBuilder.builder(
            valueListenable: selectedIndexNotifier,
            builder: (value) {
              return CustomPadding(
                horizontalFactor: .025,
                child: GestureDetector(
                  onTap: () {
                    selectedIndexNotifier.value = index;
                  },
                  child: _buildChoiceCircle(index, value),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  // Helper method to build a choice circle with styling
  Widget _buildChoiceCircle(int index, int selectedIndex) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? AppColors.primaryColor.withOpacity(.3)
            : null,
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(
          color: selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.disabledColor.withOpacity(.5),
        ),
      ),
      child: Center(
        child: TextWidget(
          text: (index + 1).toString(),
          color: selectedIndex == index ? AppColors.secondaryColor : null,
          fontSize: 17.sp,
        ),
      ),
    );
  }

  // Helper method to build cleaning material choice selection (Yes/No)
  Widget _buildMaterialChoiceSelection(
      ValueNotifier<int> cleaningMaterialsIndex) {
    return Row(
      children: [
        _buildMaterialChoiceChip(
          label: 'No, I have them',
          index: 0,
          cleaningMaterialsIndex: cleaningMaterialsIndex,
        ),
        const CustomGap(widthFactor: .04),
        _buildMaterialChoiceChip(
          label: 'Yes, please',
          index: 1,
          cleaningMaterialsIndex: cleaningMaterialsIndex,
        ),
      ],
    );
  }

  // Helper method to build individual material choice chips
  Widget _buildMaterialChoiceChip({
    required String label,
    required int index,
    required ValueNotifier<int> cleaningMaterialsIndex,
  }) {
    return ProviderHelper.valueBuilder.builder(
      valueListenable: cleaningMaterialsIndex,
      builder: (value) {
        return GestureDetector(
          onTap: () {
            cleaningMaterialsIndex.value = index;
          },
          child: CommonWidgets.chipWidget(
            text: label,
            isSelected: value == index,
            textColor: value == index ? AppColors.secondaryColor : null,
            borderColor: AppColors.disabledColor.withOpacity(.5),
          ),
        );
      },
    );
  }
}
