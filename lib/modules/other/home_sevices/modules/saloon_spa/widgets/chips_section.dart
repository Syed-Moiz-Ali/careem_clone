import 'package:flutter/material.dart';

import '../../../../../../core/common/common_functions.dart';
import '../../../../../../core/common/common_widgets.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/app_list.dart';

class ChipsSection extends StatelessWidget {
  final ScrollController scrollController;

  const ChipsSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(AppList.saloonSpaChipsList.length, (index) {
          var chip = AppList.saloonSpaChipsList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                CommonFunctions.scrollToIndex(
                  type: chip.toLowerCase(),
                  data: AppList.saloonSpaDataList,
                  scrollController: scrollController,
                );
              },
              child: CommonWidgets.chipWidget(
                text: chip,
                borderColor: AppColors.disabledColor,
              ),
            ),
          );
        }),
      ),
    );
  }
}
