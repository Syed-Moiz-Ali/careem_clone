// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../screens/menu/activities.dart';
import '../../screens/menu/help_center.dart';
import '../../screens/menu/profile.dart';
import '../common/common_widgets.dart';
import '../constants/constants.dart';
import '../navigation/navigator.dart';
import '../utils/provider_util/provider_helper.dart';
import 'custom_gap.dart';
import 'custom_icon.dart';
import 'text_widget.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  Widget _buildMenuItems() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMenuItem(Icons.home_outlined, 'Home', () {
            // NH.navigateTo(page)
          }),
          _buildMenuItem(Icons.headphones_outlined, 'Help', () {
            NH.navigateTo(const HelpCenter());
          }),
          _buildMenuItem(Icons.local_activity_outlined, 'Activity', () {
            NH.navigateTo(const Activities());
          }),
          _buildMenuItem(Icons.person_outline_rounded, 'Profile', () {
            NH.navigateTo(const ProfileScreen());
          }),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonWidgets.customAppBarIcon(
            icon: icon,
            opTap: () {
              onTap();
              ProviderHelper.read.slidingContainerProvider().toggleContainer();
            },
            size: 20.sp),
        const CustomGap(heightFactor: .01),
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

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8.w),
        bottomRight: Radius.circular(8.w),
      ),
      child: SizedBox(
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
}
