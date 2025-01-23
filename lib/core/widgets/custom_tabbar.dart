import 'package:careem/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  // final TabController? controller;

  const CustomTabBar({
    super.key,
    required this.tabs,
    // this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      // controller: controller,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      // indicatorColor: AppColors.backgroundColorDark,
      dividerHeight: 6,
      dividerColor: AppColors.disabledColor,

      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(100.w),
        borderSide: BorderSide(
            width: 6, color: AppColors.secondaryColor.withOpacity(.7)),
        // insets: const EdgeInsets.symmetric(horizontal: 0),
      ),
      tabs: tabs
          .map(
            (tab) => Tab(
              // child: TextWidget(
              //   text: tab,
              //   // fontWeight: FontWeight.w600,
              //   // color: AppColors.backgroundColorDark,
              // ),
              text: tab,
            ),
          )
          .toList(),
    );
  }
}
