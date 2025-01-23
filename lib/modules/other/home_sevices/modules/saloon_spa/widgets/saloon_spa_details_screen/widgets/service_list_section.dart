import 'package:flutter/material.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/app_list.dart';
import '../../../../../widgets/saloon_spa_card.dart';

class ServiceListSection extends StatelessWidget {
  final ScrollController scrollController;

  const ServiceListSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: AppList.saloonSpaDataList.length,
      itemBuilder: (context, index) {
        var item = AppList.saloonSpaDataList[index];
        return Column(
          children: [
            SaloonSpaCard(item: item),
            if (index != AppList.saloonSpaDataList.length - 1)
              Divider(
                color: AppColors.disabledColor.withOpacity(.3),
              ),
          ],
        );
      },
    );
  }
}
