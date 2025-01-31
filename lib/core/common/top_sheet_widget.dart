import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../providers/sliding_container_provider.dart';
import '../widgets/app_menu.dart';

Widget topSheetWidget(Widget child, BuildContext context) {
  var slidingContainerProvider = context.watch<SlidingContainerProvider>();

  return slidingContainerProvider.slideAnimation == null
      ? Container()
      : Stack(
          children: [
            child, // Main content behind the sliding container

            // Overlay to dismiss the container by tapping outside
            if (slidingContainerProvider.isContainerVisible)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    slidingContainerProvider.toggleContainer();
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    color: Colors.black.withOpacity(0.5), // Transparent overlay
                  ),
                ),
              ),

            // Sliding container itself
            // if (slidingContainerProvider.isContainerVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SlideTransition(
                position: slidingContainerProvider.slideAnimation!,
                child: const AppMenu(),
              ),
            ),
          ],
        );
}
