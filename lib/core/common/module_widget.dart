import 'dart:async';

import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';
import '../constants/images_constant.dart';
import '../navigation/navigator.dart';

class ModuleWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final Map<String, dynamic> module;
  const ModuleWidget(
      {super.key, this.height, this.width, required this.module});

  @override
  State<ModuleWidget> createState() => _ModuleWidgetState();
}

class _ModuleWidgetState extends State<ModuleWidget> {
  int _currentIndex = 0;

  // Timer to auto-advance the image every 3 seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    _startAutoSwipe();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Method to automatically change image every 3 seconds
  void _startAutoSwipe() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        // Loop back to the first image after the last one
        _currentIndex = (_currentIndex + 1) % ModulesImages.allImages.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 25.w, // Width of each item
      height: widget.height ?? 11.h, // Fixed height for each item
      // padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.disabledColor.withOpacity(.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.module['icon'] == null &&
              widget.module['title'] == 'All Services') ...[
            // PageView.builder(
            //   controller: _pageController,

            //   itemCount: ModulesImages
            //       .allImages.length, // Dynamic count based on the list size
            //   itemBuilder: (context, index) {
            //     String imagePath = ModulesImages.allImages[index];

            //     return CustomIconWidget(
            //       fit: BoxFit.scaleDown,
            //       imageUrl: imagePath,
            //       scale: 10,
            //       onTap: () {
            //         if (widget.module['screen'] != null) {
            //           NH.navigateTo(widget.module['screen']);
            //         }
            //       },
            //     );
            //   },
            // ),
            CustomIconWidget(
              fit: BoxFit.scaleDown,
              imageUrl: ModulesImages.allImages[_currentIndex],
              scale: 8,
              onTap: () {
                if (widget.module['screen'] != null) {
                  NH.navigateTo(widget.module['screen']);
                }
              },
            ),
          ] else ...[
            CustomIconWidget(
              fit: BoxFit.scaleDown,
              imageUrl: widget.module['icon'],
              scale: 8,
              onTap: () {
                if (widget.module['screen'] != null) {
                  NH.navigateTo(widget.module['screen']);
                }
              },
            ),
          ],
          const CustomGap(heightFactor: .02),
          TextWidget(
            text: widget.module['title'],
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
