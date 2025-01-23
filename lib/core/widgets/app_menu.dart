import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8.w),
        bottomRight: Radius.circular(8.w),
      ),
      child: Container(
        height: 30.h,
        child: Stack(
          children: [
            _buildMenuItems(),
            _buildBottomIndicator(),
            // _buildCloseButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMenuItem(Icons.home_outlined, 'Home', () {}),
          _buildMenuItem(Icons.headphones_outlined, 'Music', () {}),
          _buildMenuItem(Icons.local_activity_outlined, 'Activity', () {}),
          _buildMenuItem(Icons.person_outline_rounded, 'Profile', () {}),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonWidgets.customAppBarIcon(icon: icon, opTap: onTap, size: 20.sp),
        CustomGap(heightFactor: .01),
        TextWidget(
          text: label,
        ),
      ],
    );
  }

  Widget _buildBottomIndicator() {
    return Positioned(
      bottom: 1.h,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 12.w,
          height: 1.2.w,
          decoration: BoxDecoration(
            color: AppColors.backgroundColorDark,
            borderRadius: BorderRadius.circular(100.w),
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Positioned(
      top: 4.w,
      right: 4.w,
      child: GestureDetector(
        onTap: () {
          // ProviderHelper.read.slidingContainerProvider().toggleContainer();
        },
        child: Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(100.w),
          ),
          child: CustomIconWidget(
            iconData: Icons.close,
            size: 22.sp,
          ),
        ),
      ),
    );
  }
}
